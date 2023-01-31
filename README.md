<!--
 * @Author: coconut 1424392205@qq.com
 * @Date: 2023-01-04 11:09:49
 * @LastEditors: coconut 1424392205@qq.com
 * @LastEditTime: 2023-01-19 15:07:29
 * @FilePath: /chat-app/README.md
 * @Description:
 *
 * Copyright (c) 2023 by coconut 1424392205@qq.com, All Rights Reserved.
-->

# chat-app

- [ ] 聊天记录
- [ ] 添加好友
- [ ] 添加群组
- [ ] 创建群组
- [ ] 好友私聊
- [ ] 好友群聊
- [ ] 离线消息 (重点，不丢失消息)
- [ ] 发送文件
- [ ] 上下线通知 （重点）
- [ ] 好友分组管理
- [ ] 查找好友
- [ ] 消息撤回(重点)
- [ ] 删除好友
- [ ] 退出群组
- [ ] 好友在线状态（重点，实时准确）
- [ ] 异常掉线处理（重点，不管是主动退出离线，刷新网页，关闭网页，关闭浏览器，兼容所有浏览器，在线离线准确率 100%）
- [ ] 修改个人信息
- [ ] 查看好友详细信息
- [ ] 接收消息（支持多端登录，收到消息）
- [ ] 好友移动分组
- [ ] 查看好友详细资料
- [ ] 修改备注（好友备注/群备注）
- [ ] 消息加密

message AuthRequest {
string token = 1;//用户 token
string uid = 2;//用户 id
int64 timestamp =3;//发包时间戳
}

message AuthResponse {

//状态枚举

enum Status {

OK=0;

ERR =-1;

}
