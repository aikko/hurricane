# coding: utf-8
Role.create(name:'User Admin',key:'user_admin',desc:'Manage user and role assignment');
superAdmin = Role.create(name:'Super Admin',key:'super_admin',desc:'Hey, you are that super guy!');
# insert your admin user record here
user = <%=human_name%>.create(email:'',mobile:''<%=model_attributes%>)
user.roles << superAdmin
