const cds = require("@sap/cds");
const fs = require("fs");
const path = require("path");

module.exports = cds.service.impl((srv) => {
  srv.on(["POST", "CREATE"], "JiraDetails", async (req) => {
    const db = await cds.connect.to("db");
    const { JiraDetails } = db.entities("sap.cap.jira");

    console.log(`From Console`);
    const dataDir = path.join(
      __dirname,
      "../db/data/sap.cap.jira-JiraDetails.csv"
    );
    const tx = cds.tx(req);
    const data = req.data;

    const recordExist = await tx.run(
      SELECT.from(JiraDetails).columns(["JiraNo"]).where({ ID: data.ID })
    );

    if (recordExist.length > 0) {
      await tx.run(UPDATE(JiraDetails).set(req.data).where({ ID: data.ID }));
    } else {
      await tx.run(INSERT.into(JiraDetails).entries(req.data));
      let csvData = `\n ${data.ID};${data.JiraNo};${data.jiraDescription};${data.status};${data.release};${data.assignee};${data.reporter}`;
      // await fs.appendFile(dataDir, csvData, (error) => {
      //   if (error) {
      //     throw error;
      //   }
      //   console.log("Data saved");
      // });
    }

    return data;
  });
});
