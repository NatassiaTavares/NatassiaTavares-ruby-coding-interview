import React from 'react';

const TweetList = ({tweetList=[]}) => {
  return (
    <>
      { tweetList.map((data,index) => {
        if (data) {
          return (
            <div key={data.id}>
              <h5>{data.body}</h5>
            </div>
          )
        }
        return null
      }) }
    </>
  );
}

export default TweetList