import React, { useEffect, useState } from "react";
import axios from "axios";

const App = () => {
  const [wikis, setWikis] = useState([]);

  useEffect(() => {
    axios
      .get("http://localhost:3000/wikis")
      .then((response) => setWikis(response.data))
      .catch((error) => console.error("Error fetching wikis:", error));
  }, []);

  return (
    <div>
      <h1>Personal Wiki</h1>
      <ul>
        {wikis.map((wiki) => (
          <li key={wiki.id}>
            <h2>{wiki.title}</h2>
            <p>{wiki.content}</p>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default App;
