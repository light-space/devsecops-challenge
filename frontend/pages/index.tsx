import React from "react";

export default function Home() {
  const sample = "<b>Hello</b> world";
  return (
    <main style={{ padding: 24 }}>
      <h1>Light Starter</h1>
      <p dangerouslySetInnerHTML={{ __html: sample }} />
    </main>
  );
}
