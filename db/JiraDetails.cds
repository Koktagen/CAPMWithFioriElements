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
    comment: Composition of many Comments on comment.parentID = $self.ID;
}

entity TransportDetails {
    key ID: UUID @UI.Hidden: true;
    transportID: String;
    parentID: UUID;
    releasedOn: Date;
    createdBy: String;
    releasedBy: String;
}
entity Comments {
    key ID: UUID @UI.Hidden  : true;
    parentID: UUID @UI.Hidden  : true;
    comment: String;
    commentadded: Timestamp @cds.on.insert : $now;
}



