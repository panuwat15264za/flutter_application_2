// const http = require('http');
// const hostname = '127.0.0.1';
// const port = 3000;
// const server = http.createServer((req, res) => {
//   res.statusCode = 200;
//   res.setHeader('Content-Type', 'text/plain');
//   res.end('Hello World\n');
// });
// server.listen(port, hostname, () => {
//   console.log(`Server running at http://${hostname}:${port}/`);
// });

// routing
// const express = require('express');
// const app = express();
// const hostname = '127.0.0.1';
// const port = 3000;

// app.get('/hello', (req, res) => {
//     res.send("Hello world, Hello world");
//  });

//  app.listen(port, hostname, () => {
//         console.log(`Server running at   http://${hostname}:${port}/`);
// });

// MySQL
const express = require('express');
const app = express();
const hostname = '127.0.0.1';
const port = 3000;
const bodyParser = require('body-parser');
const mysql = require('mysql');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

// ใส่ค่าตามที่เราตั้งไว้ใน mysql
const con = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "",
    database: "nike_login"
})

con.connect(err => {
    if(err) throw(err);
    else{
        console.log("MySQL connected");
    }
})

let tablename = "userInfo";

const queryDB = (sql) => {
    return new Promise((resolve,reject) => {
        // query method
        con.query(sql, (err,result, fields) => {
            if (err) reject(err);
            else
                resolve(result)
        })
    })
}

app.post("/signin", async (req, res) => {
   try {
      const username = req.body.username;
      const password = req.body.password;
      const email = req.body.email;
      const sql = `SELECT COUNT(*) AS count FROM user_info WHERE username = "${username}" AND password = "${password}" AND email = "${email}"`;
      const result = await queryDB(sql);
      const count = result[0].count;
      if (count === 1) {
         console.log("Authentication successful");
         res.send("Authentication successful");
      } else {
         console.log("Authentication failed");
         res.send("Authentication failed");
      }
   } catch (error) {
      console.error("Error occurred:", error);
      res.status(500).send("Internal Server Error");
   }
});

app.post("/signup", async (req, res) => {
   /*const name = req.body.name;
   const username = req.body.username;
   const phone = req.body.phone
   const email = req.body.email;
   const password = req.body.password;
   console.log(req);
   let sql = "CREATE TABLE IF NOT EXISTS userInfo (id INT AUTO_INCREMENT PRIMARY KEY, reg_date TIMESTAMP default CURRENT_TIMESTAMP, username VARCHAR(255),password VARCHAR(100),img VARCHAR(100))";
    let result = await queryDB(sql);
   sql = `INSERT INTO signin (name, phone, username, email, password) VALUES ("${name}", "${phone}","${username}", "${email}", "${password}")`;
   result = await queryDB(sql);
   res.end("Record to database successfully");*/
   console.log("ddddd");
});

// // create table and add data to database
// app.post("/addDB",async (req,res) => {
//     let sql = "CREATE TABLE IF NOT EXISTS userInfo (id INT AUTO_INCREMENT PRIMARY KEY, reg_date TIMESTAMP default CURRENT_TIMESTAMP, username VARCHAR(255),password VARCHAR(100),img VARCHAR(100))";
//     let result = await queryDB(sql);
//     sql = `INSERT INTO userInfo (username, password) VALUES ("${req.body.username}", "${req.body.password}")`;
//     result = await queryDB(sql);
//     console.log("New record created successfully");
//     res.end("New record created successfully");
// })

// // update data
// app.post("/updateDB",async (req,res) => {
//     let sql = `UPDATE ${tablename} SET password = '${req.body.password}' WHERE username = '${req.body.username}'`;
//     let result = await queryDB(sql);
//     console.log(result);
//     res.end("Record updated successfully");
// })

// // delete data
// app.post("/deleteDB",async (req,res) => {
//     console.log("delete");
//     let sql = `DELETE FROM ${tablename} WHERE username = '${req.body.username}'`;
//     let result = await queryDB(sql);
//     console.log(result);
//     res.end("Record deleted successfully");
// })

// // show data
// app.get("/showDB", async (req,res) => {
//     // let sql = `SELECT * FROM ${tablename}`;
//     let sql = `SELECT id, username, password FROM ${tablename}`;
//     let result = await queryDB(sql);
//     result = Object.assign({},result);
//     console.log(result);
//     res.json(result);
// })
 
 app.listen(port, hostname, () => {
    console.log(`Server running at   http://${hostname}:${port}/`);
});