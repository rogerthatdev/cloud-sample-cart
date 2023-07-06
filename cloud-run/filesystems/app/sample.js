/**
 * Express webapp that generates files to a mounted NFS disk.
 *
 * 
 */

const express = require('express');
const rateLimit = require('express-rate-limit');
const fs = require('fs');

const app = express();
const limit = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  message: 'Rate limit exceeded',
  headers: true,
});
// Use your own mount directory by assigning a value to the MNT_DIR environment variable.
const mntDir = process.env.MNT_DIR || '/mnt/nfs/filestore';
app.use(limit);
app.use(mntDir, express.static(mntDir));

app.get('/ls', (req, res) => {
  // Send existing files to console.log.
  const existingFiles = fs.readdirSync(mntDir);
  console.log(`Filestore contents:\n${existingFiles}`);
  res.send("See Run service logs for contents of Filestore.")
});

app.get('/touch', (req, res) => {
  // Create a new file on filesystem.
  writeFile(mntDir)
  res.send("New file created. See Run service logs.")
});

async function writeFile(path, filePrefix = 'test') {
  let date = new Date();
  date = date.toString().split(' ').slice(0, 5).join('-');
  const filename = `${filePrefix}-${date}.txt`;
  const contents = `This test file was created on ${date}.\n`;

  fs.writeFile(`${path}/${filename}`, contents, err => {
    if (err) {
      console.error(`could not write to file system:\n${err}`);
    } else {
      console.log(`New file created at ${path}/${filename}. See Cloud Run service logs.`)
    }
  });
}

const port = parseInt(process.env.PORT) || 8080;
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});

module.exports = app;
