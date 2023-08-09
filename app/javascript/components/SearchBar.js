import React from 'react'
import TweetList from './TweetList'
import './SearchBar.css';
const { useState, useEffect, useCallback } = React;

const exampleTweets = [
  {
    body: "Example Tweet",
    id: 22
  }
];

const filterIt = (terms, arr) => {
  if ("" === terms || terms.length < 3) return arr;
  const words = terms.match(/\w+|"[^"]+"/g);
  words.push(terms);
  return arr.filter((a) => {
    const v = Object.values(a);
    const f = JSON.stringify(v).toLowerCase();

    return words.every(val => f.includes(val));
  });
};

const SearchBar = () => {
  const [items, setItems] = useState([]);

  const filterList = useCallback(({target}) => {
    const searchQuery = target.value.toLowerCase();
    const updatedList = filterIt(searchQuery, exampleTweets);
    setItems(updatedList);
  }, []);

  return (
    <div id="search-list">
      <input type="text" placeholder="Search" onChange={filterList} />
      <TweetList tweetList={items} />
    </div>
  );
};

export default SearchBar;