using JiraSRV as jira from '../../srv/JiraService';

annotate jira.JiraDetails with @(

    UI: {
        SelectionFields: [JiraNo, status, assignee, reporter, release],
        LineItem: [
            {
                Label: 'Jira Number',
                Value: JiraNo
            },
            {
                Label: 'Description',
                Value: jiraDescription
            },
            {
                Label: 'Reporter',
                Value: reporter
            },
            {
                Label: 'Assignee',
                Value: assignee
            },
            {
                Label: 'Release',
                Value: release
            }
        ],
        HeaderInfo: {
            TypeName: 'Jira Backlog',
            TypeNamePlural: 'Jira Backlogs',
            Title: {
                Value: JiraNo
            },
            Description: {
                Value: jiraDescription
            }
        },
        FieldGroup: {
            Data: [
                {
                    Label: 'Jira Status',
                    Value: status
                },
                {
                    Label: 'Release',
                    Value: release
                },
                {
                    Label: 'Assignee',
                    Value: assignee
                },
                {
                    Label: 'Reporter',
                    Value: reporter
                }
            ]
        },
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup',
                Label: 'Jira Details'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target : 'transport/@UI.LineItem',
                Label : 'Transport Details',
            }
        ]
    }
);


annotate jira.TransportDetails with @(
    UI: {
        LineItem: [
            {
                Label: 'Transport Number',
                Value: transportID
            },
            {
                Label: 'Released On',
                Value: releasedOn
            },
            {
                Label: 'Created By',
                Value: createdBy
            },
            {
                Label: 'Released By',
                Value: releasedBy
            }
        ]
    }
);

