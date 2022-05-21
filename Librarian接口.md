Librarian接口

### 登录

请求：

| URL  | /admin |
| ---- | ------ |
| 方法 | POST   |

| Key      | Value |
| -------- | ----- |
| userId |       |
| password |       |

返回例子：

```json
{
    "msg": "不存在此用户",
    "status": 1
}
```

```json
{
    "msg": "密码错误",
    "status": 2
}
```

```json
{
    "msg": "登录成功",
    "status": 3,
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOjEsImV4cCI6MTY1MTQ5NjcyNCwiaWF0IjoxNjUwODkxOTI0LCJpc3MiOiIxMjcuMC4wLjEiLCJzdWIiOiJsaWJyYXJ5IHRva2VuIn0.at3Ux92UJC56SIk5dW96MJ83VkAZ9lQdwChCgKa7k8o"
}
```



### 注册Member账号

默认密码为1234

请求：

| URL  | /register |
| ---- | --------- |
| 方法 | POST      |

| Key      | Value       |
| -------- | ----------- |
| token    | admin token |
| username |             |
| email    |             |

返回例子：

```json
{
    "msg": "注册失败",
    "status": 4,
    "userId": 0
}
```

```json
{
    "msg": "注册成功",
    "status": 5,
    "userId": 10004
}
```



### 添加Category

请求：

| URL  | /addCategory |
| ---- | ------------ |
| 方法 | POST         |

| Key      | Value       |
| -------- | ----------- |
| token    | admin token |
| category | 例如文学    |

返回例子：

```json
{
    "msg": "添加Category失败",
    "status": 24
}
```

```json
{
    "msg": "添加Location成功",
    "status": 25
}
```



### 添加Location

请求：

| URL  | /addLocation |
| ---- | ------------ |
| 方法 | POST         |

| Key      | Value       |
| -------- | ----------- |
| token    | admin token |
| location | 例如A-3     |

返回例子：

```json
{
    "msg": "添加Location失败",
    "status": 26
}
```

```json
{
    "msg": "添加Location成功",
    "status": 27
}
```



### 添加图书

请求：

| URL  | /addBook |
| ---- | -------- |
| 方法 | POST     |

| Key        | Value             |
| ---------- | ----------------- |
| token      | admin token       |
| isbn       | 例如9787302521426 |
| locationId | 例如1             |
| categoryId | 例如1             |
| count      | 例如1             |

返回例子：

返回BookId

```json
[]
```

```json
[34,35,36]
```



### 更新图书

请求：

| URL  | /updateBook |
| ---- | ----------- |
| 方法 | POST        |

| Key        | Value                    |
| ---------- | ------------------------ |
| token      | admin token              |
| bookId     | 图书ID                   |
| isbn       | 例如9787302521426        |
| name       | 例如西游记（全彩绘画版） |
| author     | 例如吴承恩               |
| locationId | 例如1                    |
| categoryId | 例如1                    |
| language   |                          |

返回例子：

```json
{
    "msg": "更新图书信息失败",
    "status": 16
}
```

```json
{
    "msg": "更新图书信息成功",
    "status": 17
}
```



### 删除图书

请求：

| URL  | /deleteBook |
| ---- | ----------- |
| 方法 | POST        |

| Key    | Value                    |
| ------ | ------------------------ |
| token  | admin token              |
| bookId | 图书ID                   |
| state  | 3或4（3：损毁，4：遗失） |

返回例子：

```json
{
    "msg": "删除图书成功",
    "status": 18
}
```

```json
{
    "msg": "删除图书成功",
    "status": 19
}
```





### 选择一本书借阅

请求：

| URL  | /borrowBook |
| ---- | ----------- |
| 方法 | POST        |
| Body | form-data   |

| Key    | Value          |
| ------ | -------------- |
| token  |                |
| bookId | 要借阅的图书ID |
| userId |                |

返回例子：

```json
{
    "msg": "借阅失败，该图书已经被借出",
    "status": 10
}
```

```json
{
    "msg": "借阅成功",
    "status": 11
}
```



### 选择一本书归还

请求：

| URL  | /returnBook |
| ---- | ----------- |
| 方法 | POST        |
| Body | form-data   |

| Key    | Value          |
| ------ | -------------- |
| token  |                |
| bookId | 要借阅的图书ID |

返回例子：

```json
{
    "msg": "归还失败，该图书不是借给你的",
    "status": 12
}
```

```json
{
    "msg": "归还失败，该图书不是借给你的",
    "status": 12
}
```





### 获取全局借阅信息

获取借阅信息页数

请求：

| URL  | /getAllBorrowBooksPages |
| ---- | ----------------------- |
| 方法 | POST                    |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |

返回例子：

```json
{
    "page": 2
}
```



获取一页借阅信息

请求：

| URL  | /getAllBorrowBooks |
| ---- | ------------------ |
| 方法 | POST               |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |
| page  |             |



返回例子：

```json
[
    {
        "Id": 34,
        "Name": "JavaScript开发实战",
        "Author": "约翰·拉尔森",
        "Isbn": "9787111586715",
        "Language": "Chinese",
        "Location": "A-1",
        "Category": "计算机",
        "Status": 2,
        "StartTime": "2022-04-11T13:26:23Z",
        "EndTime": "2022-04-24T13:26:36Z",
        "Deadline": "2022-04-21T13:26:23Z",
        "Fine": 4,
        "UserId": 10001
    },
    {
        "Id": 34,
        "Name": "JavaScript开发实战",
        "Author": "约翰·拉尔森",
        "Isbn": "9787111586715",
        "Language": "Chinese",
        "Location": "A-1",
        "Category": "计算机",
        "Status": 2,
        "StartTime": "2022-05-18T14:44:52Z",
        "EndTime": "",
        "Deadline": "2022-05-28T14:44:52Z",
        "Fine": 0,
        "UserId": 10001
    }
]
```



### 获取全局Member信息

获取Member信息页数

请求：

| URL  | /getAllMembersPages |
| ---- | ------------------- |
| 方法 | POST                |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |

返回例子：

```json
{
    "page": 1
}
```



获取一页Member

请求：

| URL  | /getAllMembers |
| ---- | -------------- |
| 方法 | POST           |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |
| page  |             |

返回例子：

```json
[{
	"Id": 10001,
	"Username": "123",
	"Email": "123@qq.com",
	"Debt": 0
}, {
	"Id": 10002,
	"Username": "456",
	"Email": "124@qq.com",
	"Debt": 1
}, {
	"Id": 10004,
	"Username": "lwt",
	"Email": "125@qq.com",
	"Debt": 0
}]
```



### 获取欠款用户信息

获取欠款用户信息页数：

请求：

| URL  | /getMembersHasDebtPages |
| ---- | ----------------------- |
| 方法 | POST                    |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |

返回例子：

```json
{
    "page": 1
}
```



获取一页欠款用户：

请求：

| URL  | /getMembersHasDebt |
| ---- | ------------------ |
| 方法 | POST               |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |
| page  |             |

返回例子：

```json
[
  {
    "Id": 10002,
    "Username": "456",
    "Email": "124@qq.com",
    "Debt": 1
  }
]
```



### 删除用户

请求：

| URL  | /deleteMember |
| ---- | ------------- |
| 方法 | POST          |

| Key    | Value       |
| ------ | ----------- |
| token  | admin token |
| userId |             |

返回例子：

```json
{
    "msg": "删除用户失败",
    "status": 22
}
```

```json
{
    "msg": "删除用户成功",
    "status": 23
}
```



### 获取总注册用户

请求：

| URL  | /getMemberCount |
| ---- | --------------- |
| 方法 | POST            |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |

返回例子：

```json
{
    "count": 2
}
```



### 获取总藏书量（By ISBN）

请求：

| URL  | /getBookCountByISBN |
| ---- | ------------------- |
| 方法 | POST                |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |

返回例子：

```json
{
    "count": 2
}
```



### 获取总藏书量（By Copy）

请求：

| URL  | /getBookCountByCopy |
| ---- | ------------------- |
| 方法 | POST                |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |

返回例子：

```json
{
    "count": 14
}
```



### 获取当前借阅量

请求：

| URL  | /getCurrentBorrowCount |
| ---- | ---------------------- |
| 方法 | POST                   |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |

返回例子：

```json
{
    "count": 1
}
```



### 获取历史总借阅量

请求：

| URL  | /getHistoryBorrowCount |
| ---- | ---------------------- |
| 方法 | POST                   |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |

返回例子：

```json
{
    "count": 9
}
```



### 获取总损毁的图书量

请求：

| URL  | /getDamagedBookCount |
| ---- | -------------------- |
| 方法 | POST                 |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |

返回例子：

```json
{
    "count": 2
}
```



### 获取总遗失的图书量

请求：

| URL  | /getLostBookCount |
| ---- | ----------------- |
| 方法 | POST              |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |

返回例子：

```json
{
    "count": 1
}
```



### 获取总收集的罚款量

请求：

| URL  | /getPaidFine |
| ---- | ------------ |
| 方法 | POST         |

| Key   | Value       |
| ----- | ----------- |
| token | admin token |

返回例子：

```json
{
    "fine": 4
}
```

