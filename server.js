
const express = require('express');
const app = express();
const port = 3000;

function isAuth(req, res, next) {
    const auth = req.headers.authorization;
    if (auth === 'super hasło') {
      next();
    } else {
      res.status(401);
      res.send('Brak Dostępu');
    }
}

app.get("/adminmenu", isAuth, (req,res) => {
    var adm = exports["anon-api"].getadm()
    var adm2 = adm.length
    const info = [
        {
            adm: adm2,
        },
    ];
  
    res.json(info);
});




app.listen(port, () => console.log(`API SERWERA ZOSTAŁO URUCHOMIONE NA PORCIE: ${port}`));