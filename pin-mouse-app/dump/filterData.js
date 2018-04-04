const fs = require('fs');

const dataText = fs.readFileSync('starredRepos.json', 'utf8');
const dataObj = JSON.parse(dataText);

// console.log(dataText);
// console.log(dataObj);
console.log(typeof dataObj);
console.log(Array.isArray(dataObj));

const mapped = dataObj.map(item => ({
  id: item.id,
  name: item.name,
  full_name: item.full_name,
  description: item.description,
}));
// console.log(mapped);

fs.writeFileSync('starredReposSmaller.json', JSON.stringify(mapped));

// /home/administrator/batcave/pin-mouse/pin-mouse-app/dump/repoIssues.json

const repoText = fs.readFileSync('repoIssues.json', 'utf8');
const repoObj = JSON.parse(repoText);

const mappedRepos = repoObj.map(item => ({
  id: item.id,
  created_at: item.created_at,
  body: item.body,
  user: {
    id: item.user.id,
    login: item.user.login,
    avatar_url: item.user.avatar_url,
  },
}));

fs.writeFileSync('repoIssuesSmaller.json', JSON.stringify(mappedRepos));
