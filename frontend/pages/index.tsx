import React, { useState } from "react";

export default function Home() {
  // Imagine this comes from an "Invoice note" field (rich-text editor) stored in the DB.
  const [invoiceNoteHtml, setInvoiceNoteHtml] = useState(
    "<b>Note:</b> Please match this to PO-1042 and book to Marketing."
  );

  return (
    <main style={{ padding: 24, maxWidth: 820 }}>
      <h1>Light Starter</h1>

      <h2 style={{ marginTop: 24 }}>Invoice note (rich text)</h2>
      <p style={{ marginTop: 8, opacity: 0.8 }}>
        Example feature: show a formatted invoice note/memo with bold/links.
      </p>

      <label style={{ display: "block", marginTop: 12, marginBottom: 8 }}>
        Edit invoice note
      </label>

      <textarea
        value={invoiceNoteHtml}
        onChange={(e) => setInvoiceNoteHtml(e.target.value)}
        rows={6}
        style={{ width: "100%", marginBottom: 16, fontFamily: "monospace" }}
      />

      <h3>Preview</h3>
      <div
        style={{
          border: "1px solid #ddd",
          borderRadius: 8,
          padding: 12,
        }}
        dangerouslySetInnerHTML={{ __html: invoiceNoteHtml }}
      />
    </main>
  );
}
