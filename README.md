# WorkCompass Live Coding Challenge

## Introduction
This snippet offers a quick glimpse of the WorkCompass Web Application, allowing candidates to explore the system and practice before their live coding interview.

## Interview Requirements
Our Live Coding interviews are conducted using VS Code and the [Live Share Extension](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare).

You can access VS Code directly in any [browser](https://vscode.dev/) or install it on your operating system.

During the interview, the host will start a Live Share session and provide you with a link to join. If you're using VS Code on your local machine, please ensure the [Live Share Extension](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare) is installed in advance.

## Business Requirements
A manager and an employee collaboratively create a *Performance Plan* (referred to as a `Plan`), which outlines key criteria for evaluating the employee’s performance and supporting their professional growth within the company.

Each Plan consists of multiple key criteria (referred to as `Item`), with both the manager and the employee contributing descriptions. The manager is responsible for assigning ratings to these Items. The employee’s overall performance rating (also referred to as the `Subject` or `Reviewee` rating) is calculated as the average of all Item ratings within the Plan.

## Technical Requirements

## Item
* Every item must be associated with a plan.
* If a plan is deleted, all associated items must also be removed.
* Each item must have a valid positive numerical score (cannot be `nil`, negative or a String).
* Each item must include a valid description (cannot be `nil` or empty).

## Plan
* Every plan must have a valid due date.

## Exercise Requirements

### Exercise 1: Calculate Plan Score
The `Plan#score` must always return its average score based on the items linked to the plan.
Formula: ```Plan Score = Sum(Item Score) / Total of Items```

### Exercise 2: Show Plan Status
Implement logic to display the plan status:
* If `due_date` is earlier than today, the status should be "archived".
* If `due_date` is later than today, the status should be "current".

### Exercise 3: User Plan Statistics
Implement the logic in `User#performances` that returns a hash containing statistics for each user who has at least one plan. The hash should have user name as keys, and each value should be a hash with the following keys:
* `average_score`: The average score of the user's plans.
* `plan_count`: The total number of plans associated with the user.

### Exercise 4: Find Plans Due Within a Specified Number of Days
Implement the logic in `Plan#due_in` that returns an array of plans whose `due_date` is within the specified number of days from today's date. The number of days should be passed as a parameter to the `due_in` method.

## Testing
To verify that all requirements have been implemented correctly, you should be able to execute the RSpec tests without failures:

```bash
RAILS_ENV=test bundle exec rspec
```

## Devcontainer
You can build the container in VSCode by pressing `CTRL+SHIFT+P` and selecting `Dev Containers: Reopen in Container`. The initial build may take some time, as it needs to fetch and prepare the container.

