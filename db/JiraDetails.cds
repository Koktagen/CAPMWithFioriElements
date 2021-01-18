namespace sap.cap.jira;

entity JiraDetails {
    key ID: UUID @UI.Hidden  : 	true;
    JiraNo: String @title  : 'Jira Number';
    jiraDescription: String @title  : 'Desription';
    status: String;
    release: String(4);
    assignee: String;
    reporter: String;
    transport: Composition of many  TransportDetails on transport.parentID = $self.ID;
}

entity TransportDetails {
    key ID: UUID @UI.Hidden: true;
    transportID: String;
    parentID: UUID;
    releasedOn: Date;
    createdBy: String;
    releasedBy: String;
}



