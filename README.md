# API DO SERWERA FIVEM 

## KONFIGURACJA

1. Zmiana portu w pliku server.js

```
const port = 3000; /// wpisz dowolny nie używany port
```
2. Zmiana hasła w pliku server.js

```
function isAuth(req, res, next) {
    const auth = req.headers.authorization;
    if (auth === 'super hasło') {  /// zmień na swoje hasło
      next();
    } else {
      res.status(401);
      res.send('Brak Dostępu');
    }
}

```


## DODAWANIE WŁASNYCH FUNKCJI

1. Dodaj nową funkcję do server.js

    ```
    app.get("/getadm", isAuth, (req,res) => {
        var adm = exports["anon-api"].getadm() /// export z pliku server.lua
        const info = [
            {
                adm: adm, /// dane które zostaną wysłane 
            },
        ];
      
        res.json(info);
    });
    
    ```
2. Dodaj nową funkcję do server.lua
    ```
                exports('getadm', function()
                    local players = {}
                    
                    for i, playerId in ipairs(GetPlayers()) do
                        local  xPlayer = ESX.GetPlayerFromId(playerId)
                
                        if xPlayer.getGroup() == "owner" or xPlayer.getGroup() == "managment" or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "moderator" or xPlayer.getGroup() == "support" or xPlayer.getGroup() == "tsupport" then
                
                            local pl = {playerId}
                            table.insert(players, pl)
                
                        end
                    
                    end
                
                    return(players)
                
                end)
    
    ```

3. Dodaj nowy export do fxmanifest.lua

    ```
    server_export {
        'getadm',
    }
    ```

## PRZYKŁADOWE UŻYCE W BOCIE DISCORD

    ```
            const data = await axios.get('http://127.0.0.1:3000/getadm', {
              headers: {
                'authorization': `super haslo`  /// zmień na hasło z pliku server.js
              }
            }).then((data) => {return data}).catch((error) => {console.log(error)})
    
            console.log(data.data[0])
    ```
