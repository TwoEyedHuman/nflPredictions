import sys
import mysql.connector
import argparse
import time
import random

INSERT_QUERY = "insert into game_predictions values(%s, %s, %s, %s)"
MAX_INT = 2147483647

conn = mysql.connector.connect(host='localhost',database='nfl-predictions',user='hbstudent',password='hbstudent')
if not conn.is_connected():
    raise Exception("Unable to connect to database: " + str(conn))

def main(args):
    parser = argparse.ArgumentParser()
    parser.add_argument("--runcount", type=int)
    parser.add_argument("--seed", type=int)
    parser.add_argument("--method", type=int)
    args = parser.parse_args()
    
    cursor = conn.cursor(dictionary=True)
    cursor.execute("select * from nfl_schedule")
    games = cursor.fetchall()
    
    if args.runcount is None or args.runcount == 1:
        runCount = 1
        randSeed = random.randrange(MAX_INT) if args.seed is None else args.seed
    elif args.runcount > 1:
        runCount = args.runcount
        randSeed = random.randrange(MAX_INT)
    
    if args.method == 1:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("select * from method1_probs")
        scores = cursor.fetchall()
    else:
        scores = None
    
    for i in range(1,runCount+1):
        print("Running session " + str(i) + " with seed " + str(randSeed))
        random.seed(randSeed)
        for game in games:
            game["winner"] = determineWinner(game, args.method, scores)
            recordTuple = (randSeed, args.method, game["game_id"], game["winner"])
            cursor.execute(INSERT_QUERY, recordTuple)
        conn.commit()
        
        randSeed = random.randrange(MAX_INT)
  
    conn.close()
    return 0


def determineWinner(game, method, scores):
    if method == 0:
        return determineRandomWinner(game)
    if method == 1:
        return determineMethod1Winner(game, scores)
    else:
        raise ValueError("Invalid mehtod supplied to determineWinner()")
    
    
def determineMethod1Winner(game, scores):
    scoresDict = {score["team"]: score["score"] for score in scores}
    homeTeamScore = scoresDict[game["home_team"]]
    awayTeamScore = scoresDict[game["away_team"]]
    homeTeamProbability = homeTeamScore / (homeTeamScore + awayTeamScore)
    if random.random() < homeTeamProbability:
        return game["home_team"]
    else:
        return game["away_team"]


def determineRandomWinner(game):
    if random.random() < 0.500:
        return game["home_team"]
    else:
        return game["away_team"]


if __name__ == "__main__":
    start_time = time.time()
    main(sys.argv)
    print("--- %0.2f seconds ---" % (time.time() - start_time))