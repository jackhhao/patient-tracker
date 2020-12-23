from flask import Flask
from flask import request
import pymysql


app = Flask(__name__)

@app.route("/")
def home():
    args = request.args

    db = pymysql.connect("localhost","root","parWONE123","edd_server" )
    cursor = db.cursor()

    

    if len(args) > 0:
        if args["usage"] == "input":
            newDistance = args["distance"]
            sql = "insert into `data` (`distance`) values (" + newDistance  + ");"
            print(sql)
            try:
            # Execute the SQL command
                cursor.execute(sql)
                db.commit()

            except:
                print("error")
            db.close()
        return "success"
    else:
        # SQL query to read information from database
        sql = "SELECT * FROM data"
        returnArray = []

        try:
        # Execute the SQL command
            cursor.execute(sql)

        # Fetch and save all the rows in a list of lists
            results = cursor.fetchall()
            for x in range(0,len(results)):
                returnArray.append(results[x][0]) 
        except:
            print("error")
        db.close()
        
        return str(returnArray[-1])
    
if __name__ == "__main__":
    app.run(debug=False, host='192.168.87.188', port=5000)