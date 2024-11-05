const express = require("express");
const app = express();
app.set("view engine", "ejs");
app.get("/", (req, res) => {
  res.render("index", { title: "Hello, EJS!" });
});
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});