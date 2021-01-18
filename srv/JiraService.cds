using { sap.cap.jira as jira } from '../db/JiraDetails';


@path: 'MyJiraSRV'
service JiraSRV {

    @odata.draft.enabled  : true
    entity JiraDetails as projection on jira.JiraDetails;
    entity TransportDetails as projection on jira.TransportDetails;
    entity comments as projection on jira.Comments;
}

