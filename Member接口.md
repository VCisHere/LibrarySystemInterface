Member接口

### 登录

输入`userId`和`password`，登录成功后会返回一个`token`

请求：

| URL  | /login    |
| ---- | --------- |
| 方法 | POST      |
| Body | form-data |

| Key      | Value    |
| -------- | -------- |
| userId   | 用户ID   |
| password | 用户密码 |

返回例子：

```json
{
    "msg": "用户登录成功",
    "status": 3,
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOjEwMDAxLCJleHAiOjE2NTEzOTgxMTksImlhdCI6MTY1MDc5MzMxOSwiaXNzIjoiMTI3LjAuMC4xIiwic3ViIjoibGlicmFyeSB0b2tlbiJ9.GRyG1lkLpnDB6qKfKwOhqPa6ocAxyI8q801riYCU-nk"
}
```



### 查看Locations

请求：

| URL  | /getLocations |
| ---- | ------------- |
| 方法 | GET           |

返回例子：

```json
[
    {
        "Id": 1,
        "Name": "A-1"
    },
    {
        "Id": 2,
        "Name": "A-2"
    }
]
```





### 查看Categories

请求：

| URL  | /getCategories |
| ---- | -------------- |
| 方法 | GET            |

返回例子：

```json
[
    {
        "Id": 1,
        "Name": "计算机"
    },
    {
        "Id": 2,
        "Name": "文学"
    }
]
```



### 查看所有图书

获取页数（一共有多少页）

请求：

| URL  | /getBooksPages |
| ---- | -------------- |
| 方法 | GET            |

返回例子：

```json
{
    "page": 1
}
```



获取一页图书

请求：

| URL  | /getBooks |
| ---- | --------- |
| 方法 | GET       |

| Key  | Value    |
| ---- | -------- |
| page | 指定页数 |

返回例子：

```json
[
    {
        "Id": 57,
        "Name": "西游记（全彩绘画版）",
        "Author": "吴承恩",
        "Isbn": "9787302521426",
        "Language": "Chinese",
        "Location": "A-2",
        "Category": "文学",
        "Status": 0
    },
    {
        "Id": 58,
        "Name": "西游记（全彩绘画版）",
        "Author": "吴承恩",
        "Isbn": "9787302521426",
        "Language": "Chinese",
        "Location": "A-2",
        "Category": "文学",
        "Status": 0
    },
    {
        "Id": 59,
        "Name": "JavaScript",
        "Author": "约翰·拉尔森",
        "Isbn": "9787111586715",
        "Language": "Chinese",
        "Location": "A-1",
        "Category": "计算机",
        "Status": 0
    }
]
```



### 通过Location查看图书

获取页数（一共有多少页）

请求：

| URL  | /getBooksPagesByLocation |
| ---- | ------------------------ |
| 方法 | GET                      |

| Key        | Value          |
| ---------- | -------------- |
| locationId | 指定locationId |

返回例子：

```json
{
    "page": 1
}
```

获取一页图书

请求：

| URL  | /getBooksByLocation |
| ---- | ------------------- |
| 方法 | GET                 |

| Key        | Value          |
| ---------- | -------------- |
| page       | 指定页数       |
| locationId | 指定locationId |

返回例子：同查看所有图书



### 通过Category查看图书

获取页数（一共有多少页）

请求：

| URL  | /getBooksPagesByCategory |
| ---- | ------------------------ |
| 方法 | GET                      |

| Key        | Value          |
| ---------- | -------------- |
| categoryId | 指定categoryId |

返回例子：

```json
{
    "page": 1
}
```

获取一页图书

请求：

| URL  | /getBooksByCategory |
| ---- | ------------------- |
| 方法 | GET                 |

| Key        | Value          |
| ---------- | -------------- |
| page       | 指定页数       |
| categoryId | 指定categoryId |

返回例子：同查看所有图书



### 选择一本书预约

请求：

| URL  | /reserveBook |
| ---- | ------------ |
| 方法 | POST         |
| Body | form-data    |

| Key    | Value          |
| ------ | -------------- |
| token  |                |
| bookId | 要预约的图书ID |

返回例子：

```json
{
    "msg": "预约成功",
    "status": 7
}
```

```json
{
    "msg": "预约失败，该图书已经被预约了",
    "status": 6
}
```



### 选择一本书取消预约

请求：

| URL  | /cancelReserveBook |
| ---- | ------------ |
| 方法 | POST         |
| Body | form-data    |

| Key    | Value              |
| ------ | ------------------ |
| token  |                    |
| bookId | 要取消预约的图书ID |



返回例子：

```json
{
    "msg": "取消预约成功",
    "status": 9
}
```

```json
{
    "msg": "取消预约失败，该图书不是被你预约的",
    "status": 8
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



### 查看自己的预约（包括历史预约）

获取有多少页

请求：

| URL  | /getReserveBooksPages |
| ---- | --------------------- |
| 方法 | POST                  |
| Body | form-data             |

| Key   | Value |
| ----- | ----- |
| token |       |

返回例子：

```json
{
    "page": 1
}
```



获取某一页

请求：

| URL  | /getReserveBooks |
| ---- | ---------------- |
| 方法 | POST             |
| Body | form-data        |

| Key   | Value  |
| ----- | ------ |
| token |        |
| page  | 第几页 |

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
        "StartTime": "2022-05-04T19:27:07Z",
        "EndTime": "2022-05-04T20:24:33Z",
        "CanceledTime": ""
    }
]
```



### 查看自己借阅的图书（包括历史借阅）

获取有多少页

请求：

| URL  | /getBorrowBooksPages |
| ---- | -------------------- |
| 方法 | POST                 |
| Body | form-data            |

| Key   | Value |
| ----- | ----- |
| token |       |

返回例子：

```json
{
    "page": 1
}
```



获取某一页：

请求：

| URL  | /getBorrowBooks |
| ---- | --------------- |
| 方法 | POST            |
| Body | form-data       |

| Key   | Value  |
| ----- | ------ |
| token |        |
| page  | 第几页 |

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
        "Fine": 4
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
        "Fine": 0
    }
]
```



### 查看自己的历史借书时长

请求：

| URL  | /getMemberHistoryBorrowTime |
| ---- | --------------------------- |
| 方法 | POST                        |
| Body | form-data                   |

| Key   | Value |
| ----- | ----- |
| token |       |

返回例子：

```json
{
    "days": 27
}
```



### 查看自己需要缴纳的罚金

请求：

| URL  | /getMemberFine |
| ---- | -------------- |
| 方法 | POST           |
| Body | form-data      |

| Key   | Value |
| ----- | ----- |
| token |       |

返回例子：

```json
{
    "fine": 1
}
```



### 缴纳罚金

请求：

| URL  | /getMemberPayURL |
| ---- | ---------------- |
| 方法 | POST             |
| Body | form-data        |

| Key   | Value |
| ----- | ----- |
| token |       |

返回例子：

```json
{
    "url": "https://openapi.alipaydev.com/gateway.do?app_id=2021000119670503&biz_content=%7B%22subject%22%3A%22%E7%BD%9A%E9%87%91%22%2C%22out_trade_no%22%3A%227%22%2C%22total_amount%22%3A%22-1%22%2C%22product_code%22%3A%22FAST_INSTANT_TRADE_PAY%22%7D&charset=utf-8&format=JSON&method=alipay.trade.page.pay&notify_url=&return_url=&sign=FZFTkWTQVu3MHcxzLe%2BBDSf8NSxD6QpLtM1i77ivO%2BPf4Ams40JvA8yezr%2BZFV01ECxeV3Mu0lQClBSx6p1xhngiQzEapFdkm6AbYKF%2F9Bln8Vkgvjd1EdwR52SU8uewvOlXkfozYwAA7SYGwAXnOANkQboDq%2F2AlgokQiKOGcPVqRY%2FLU54YWneuMUTwrcErNE%2BlIxkSiIJ5ECFQQDYns4avg85tI%2FW7uKA%2F2q1rtjqbX4K0LK8pL0ndCfHcNAn%2BQaGq9%2FtFpHxbxNP9qwCwElNoGJt67fl8UDMQByhK48mLObZdv6zgGF8Gz2G1mDQbBAsXFCa8sda%2F1%2F3vRP56A%3D%3D&sign_type=RSA2&timestamp=2022-04-25+19%3A02%3A33&version=1.0"
}
```



### 修改密码

请求：

| URL  | /updatePassword |
| ---- | --------------- |
| 方法 | POST            |

| Key         | Value |
| ----------- | ----- |
| token       |       |
| oldPassword |       |
| newPassword |       |

返回例子：

```json
{
    "msg": "修改密码成功",
	"status": 21
}
```

```json
{
    "msg": "修改密码失败",
	"status": 20
}
```

