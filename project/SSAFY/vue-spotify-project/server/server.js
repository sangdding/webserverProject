import express from "express"
import dotenv from "dotenv"
import cors from "cors"
import bodyParser from 'body-parser';
// const lyricsFinder = require("lyrics-finder")
import SpotifyWebApi from "spotify-web-api-node"

dotenv.config()
const app = express()
app.use(cors())
// body-parser 미들웨어 등록
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.post("/refresh", (req, res) => {
  const refreshToken = req.body.refreshToken

  const spotifyApi = new SpotifyWebApi({
    redirectUri: process.env.REDIRECT_URI,
    clientId: process.env.CLIENT_ID,
    clientSecret: process.env.CLIENT_SECRET,
    refreshToken,
  })

  spotifyApi
    .refreshAccessToken()
    .then(data => {
      res.json({
        accessToken: data.body.accessToken,
        expiresIn: data.body.expiresIn,
      })
    })
    .catch(err => {
      console.log(err)
      res.sendStatus(400)
    })
})

app.post("/login", (req, res) => {
  const code = req.body.code
  const spotifyApi = new SpotifyWebApi({
    redirectUri: "http://localhost:5173",
    clientId: "6d5da789617a425596235602ab5ba380",
    clientSecret: "877477ecc7f442ec80f74ba32a6288ad",
    // redirectUri: process.env.REDIRECT_URI,
    // clientId: process.env.CLIENT_ID,
    // clientSecret: process.env.CLIENT_SECRET,
  })

  spotifyApi
    .authorizationCodeGrant(code)
    .then(data => {
      res.json({
        accessToken: data.body.access_token,
        refreshToken: data.body.refresh_token,
        expiresIn: data.body.expires_in,
      })
    })
    .catch(err => {
      res.sendStatus(400)
    })
})

// app.get("/lyrics", async (req, res) => {
//   const lyrics =
//     (await lyricsFinder(req.query.artist, req.query.track)) || "No Lyrics Found"
//   res.json({ lyrics })
// })

app.listen(5174)