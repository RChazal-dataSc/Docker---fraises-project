const express = require("express");
const app = express();
const port = 8080;

app.get("/", async (req, res) => {
  res.setHeader("Content-Type", "text/html");
  res.status(200);
  res.send("<h1>Les fraises sont perchées sur le tabouret de mon grand père</h1>");
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
