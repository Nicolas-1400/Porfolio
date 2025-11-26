const express = require("express")
const router = express.Router();
const request = require("request");

router.get('/', (req, res) => {
    request("https://jsonplaceholder.typicode.com/users", (err, response, body) => {
        if (!err){
            const users = JSON.parse(body);
            res.render("misitioHome", {
                layout: "misitio",
                users: users
            });
        }
            });
});
module.exports = router