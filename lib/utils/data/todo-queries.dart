import 'package:graphql_flutter/graphql_flutter.dart';

allTodos() => gql('''

query {
  todos {
    id
    name
    created_at
    due_date
    completed
    task_type {
      id name
    }
  }
}

''');

addTodo() => gql('''

mutation (\$type_id:Int!, \$name:String!, due_date: timestamptz! ) {
  insert_todos_one(object: {type_id: \$type_id, name: \$name, due_date: \$due_data}) {
    id
  }
}


''');

alternativeAddTodo() => gql('''

mutation (\$data:todos_insert_input! ) {
  insert_todos_one(object: \$data) {
    id
  }
}


''');

deleteTodoMutation() => gql('''


mutation (\$id:Int!) {
  delete_todos_by_pk(id: \$id){
    id
  }
}

''');

updateTodoMutation() => gql('''

mutation (\$id: Int!, \$data: todos_set_input!) {
  update_todos_by_pk(pk_columns: {id: \$id}, _set: \$data) {
    id
  }
}



''');

taskType() => gql('''

query {
  task_type {
    id name
  }
}

''');
