# Starmoe の Blog [TLSD]

*傻星瞳的新网站，扬帆起航。*

## 自己做的一段代码（Py）

~~~ py
import random
import time
import os
print("你好，现在你有10秒的时间记忆下列物品及其编号")
things=["草方块","土豆","原石","水晶","体力药水","扩充补给卡","家园补给卡","精准补给卡","黑曜石","基岩"]
for i in range(10):
    print(i,":",things[i])   #在屏幕上显示物品及其编号
time.sleep(10)               #延时10秒
os.system("cls")             #清屏
n=0                          #记录答对的题数，初值为0
t2=random.sample(things,5)   #随机抽出五个物品
for i in t2:                 #出5题
    ans=int(input(i + "的编号是："))#输入编号答题
    if i==things[ans]:
        n=n+1                #如果回答正确，答对的题数加1
print("\n你一共答对了",n,"次")#屏幕显示答对的题数
input("\n按回车键结束程序")
~~~

---

## 没了，以下是我的博客（搬自b站）  

---

[1.MC也能“云存档”？将你的游戏存档同步到Onedrive](/archive/2022-12-29-01.html "MC也能“云存档”？将你的游戏存档同步到Onedrive")  
[2.极简！VcXsrv+WSL1使用xfce图形界面](/archive/2022-12-29-02.html "极简！VcXsrv+WSL1使用xfce图形界面")  
[3.时间炸弹的科普以及破解方法](/archive/2022-12-29-03.html "时间炸弹的科普以及破解方法")  
[4.在X64 Windows上运行Windows RT](/archive/2022-12-30-01.html "在X64 Windows上运行Windows RT")  
[5.真的有“我的世界网页版！”Minecraft 4K介绍与游玩方法](/archive/2022-12-30-02.html "真的有“我的世界网页版！”Minecraft 4K介绍与游玩方法")  
[6.无需root在手机上运行Linux，UserLAnd使用入门](/archive/2022-12-30-03.html "无需root在手机上运行Linux，UserLAnd使用入门")  
[7.UserLAnd进阶教程1：配置简易VNC图形界面](/archive/2022-12-31-01.html "UserLAnd进阶教程1：配置简易VNC图形界面")

---

## 工具箱

---

[Minecraft 4K](/Other/MC4K.html)  
[RSS](/rss/atom.xml)

---

## 其他链接

---
