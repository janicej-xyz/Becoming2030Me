function emailMonthlySummary() {
  const sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("Form Responses 1");
  const data = sheet.getDataRange().getValues();
  const headers = data[0];
  const rows = data.slice(1);

  const today = new Date();
  const lastMonth = new Date(today.getFullYear(), today.getMonth() - 1, 1);
  const lastMonthNum = lastMonth.getMonth();
  const lastMonthYear = lastMonth.getFullYear();

  // Filter rows for last month
  const filtered = rows.filter(row => {
    const date = new Date(row[0]);
    return date.getMonth() === lastMonthNum && date.getFullYear() === lastMonthYear;
  });

  if (filtered.length === 0) {
    Logger.log("No entries found for last month.");
    return;
  }

  // Stats counters
  let aiNewsYes = 0, deepWorkYes = 0, repsNonEmpty = 0;
  const tableRows = [];
  const gratitudeList = [];
  const wordList = [];

  filtered.forEach(row => {
    const date = new Date(row[0]);
    const shortDate = Utilities.formatDate(date, Session.getScriptTimeZone(), "MMM dd");

    const ai = row[1] === "Yes" ? "✅" : "❌";
    const dw = row[2] === "Yes" ? "✅" : "❌";
    const reps = row[3] && row[3] !== "None" ? row[3] : "—";

    if (row[1] === "Yes") aiNewsYes++;
    if (row[2] === "Yes") deepWorkYes++;
    if (row[3] && row[3] !== "None") repsNonEmpty++;

    tableRows.push(`<tr><td>${shortDate}</td><td>${ai}</td><td>${dw}</td><td>${reps}</td></tr>`);

    if (row[4]) wordList.push(...row[4].split(",").map(w => w.trim()));
    if (row[5]) gratitudeList.push({ date: shortDate, text: row[5] });
  });

  // Count top 3 words
  const wordFreq = {};
  wordList.forEach(word => {
    wordFreq[word] = (wordFreq[word] || 0) + 1;
  });
  const topWords = Object.entries(wordFreq)
    .sort((a, b) => b[1] - a[1])
    .slice(0, 5)
    .map(([word, count]) => `• ${word} (${count})`)
    .join("<br>");

  const tableHTML = `
    <table border="1" cellpadding="6" style="border-collapse: collapse;">
      <tr><th>Date</th><th>AI News</th><th>Deep Work</th><th>100 Reps</th></tr>
      ${tableRows.join("\n")}
    </table>`;

  const gratitudeHTML = gratitudeList
    .map(g => `<p><b>${g.date}</b> — “${g.text}”</p>`)
    .join("\n");

  const monthName = lastMonth.toLocaleString('default', { month: 'long' });

  const htmlBody = `
    <h2>🌱 BECOMING: 2030Me — Monthly Summary</h2>
    <p><b>📅 Period:</b> ${monthName} ${lastMonthYear}<br>
    <b>📝 Entries:</b> ${filtered.length}<br>
    <b>✅ AI News:</b> ${aiNewsYes} days<br>
    <b>🧠 Deep Work:</b> ${deepWorkYes} days<br>
    <b>💪 100 Reps:</b> ${repsNonEmpty} time(s)</p>

    <h3>📊 Completion Overview</h3>
    ${tableHTML}

    <h3>🧠 Common Themes (Top Words)</h3>
    <p>${topWords}</p>

    <h3>💌 Gratitude Notes</h3>
    ${gratitudeHTML}
  `;

  MailApp.sendEmail({
    to: "janicejiang2021@gmail.com", // Update if needed
    subject: `📬 BECOMING 2030Me – Monthly Summary (${monthName} ${lastMonthYear})`,
    htmlBody: htmlBody
  });
}
