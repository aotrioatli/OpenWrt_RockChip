### 机场推荐 [ENET--IEPL内网专线接入](https://www.easyenable.com/#/register?code=CNC7La7m)
# OpenWrt — RockChip多设备固件云编译
- 支持rk3588，rk356x，rk3399，rk3328
### 源代码地址
https://github.com/DHDAXCW/lede-rockchip

### 支持设备
```
embedfire_doornet1
embedfire_doornet2
embedfire_lubancat-1n
embedfire_lubancat-1
embedfire_lubancat-2n
embedfire_lubancat-2
embedfire_lubancat-4
embedfire_lubancat-5
friendlyarm_nanopc-t6
friendlyarm_nanopi-r2c
friendlyarm_nanopi-r2s
friendlyarm_nanopi-r4se
friendlyarm_nanopi-r4s
friendlyarm_nanopi-r5c
friendlyarm_nanopi-r5s
friendlyarm_nanopi-r6c
friendlyarm_nanopi-r6s
hinlink_h88k
hinlink_opc-h66k
hinlink_opc-h68k
hinlink_opc-h69k
```

### 固件默认配置
- 用户名：`root` 密码：`password` 管理IP：`192.168.11.1`
- 下载地址：https://github.com/DHDAXCW/OpenWrt_RockChip/releases 对应 Tag 标签内下载固件
- 刷机方法请参考dn2刷机 https://github.com/DHDAXCW/OpenWrt_RockChip/blob/master/data/emmc.md
- 电报交流群：https://t.me/armopenwrt

### 如何触发编译

#### immortalwrt_rockchip_docker 工作流
1. 进入仓库的 `Actions` 页面
2. 选择 `immortalwrt_rockchip_docker` 工作流
3. 点击 `Run workflow` 按钮
4. 在弹出的界面中：
   - 勾选 `Build all devices` 构建所有设备固件（默认选项）
   - 或取消 `Build all devices`，在 `devices` 输入框中输入逗号分隔的设备列表
     - 示例：`armsom_sige3,friendlyarm_nanopi_r5s`
     - 示例：`hinlink_h88k,radxa_rock_5b`
5. 点击绿色的 `Run workflow` 按钮开始编译

**注意：**
- 默认会构建所有设备的固件
- 取消 `Build all devices` 后需要在 `devices` 输入框中输入设备名称（使用下划线，多个设备用逗号分隔）
- 设备名称中的下划线会自动转换为连字符（例如 `friendlyarm_nanopi_r5s` → `friendlyarm_nanopi-r5s`）
- 选择多个设备时，系统会自动启用 MULTI_PROFILE 模式
- 如果不选择 `Build all devices` 且没有输入任何设备，工作流将报错

#### immortalwrt_rockchip 和 immortalwrt_rockchip_fwq 工作流
1. 进入仓库的 `Actions` 页面
2. 选择需要运行的工作流（`immortalwrt_rockchip` 或 `immortalwrt_rockchip_fwq`）
3. 点击 `Run workflow` 按钮
4. 在弹出的界面中：
   - 勾选 `Build all devices` 构建所有设备固件（默认选项）
   - 或取消 `Build all devices`，然后勾选需要编译的目标设备（支持多选）
5. 点击绿色的 `Run workflow` 按钮开始编译

### 固件特色
1. 集成 iStore 应用商店，可根据自己需求自由安装所需插件
2. 集成应用过滤插件，支持游戏、视频、聊天、下载等 APP 过滤
3. 集成在线用户插件，可查看所有在线用户 IP 地址与实时速率等
4. 集成部分常用有线、无线、3G / 4G /5G 网卡驱动 可在issues提支持网卡，看本人能力了。。。
5. 支持在线更新，从2024.03.27之后就能通过后台升级
6. 特调优化irq中断分配网卡绑定cpu

### 固件展示
<img width="1304" alt="image" src="https://github.com/DHDAXCW/OpenWrt_RockChip/assets/74764072/acc32c0b-a8aa-4250-88c1-a1d4d3f24ec2">

### 特别提示 [![](https://img.shields.io/badge/-个人免责声明-FFFFFF.svg)](#特别提示-)

- **因精力有限不提供任何技术支持和教程等相关问题解答，不保证完全无 BUG！**

- **本人不对任何人因使用本固件所遭受的任何理论或实际的损失承担责任！**

- **本固件禁止用于任何商业用途，请务必严格遵守国家互联网使用相关法律规定！**

### 有bug请在 https://github.com/DHDAXCW/OpenWrt_RockChip/issues 提问题

### 鸣谢

特别感谢以下项目：

Openwrt 官方项目：

<https://github.com/openwrt/openwrt>

Lean 大的 Openwrt 项目：

<https://github.com/coolsnowwolf/lede>

immortalwrt 的 OpenWrt 项目：

<https://github.com/immortalwrt/immortalwrt>

P3TERX 大佬的 Actions-OpenWrt 项目：

<https://github.com/P3TERX/Actions-OpenWrt>

SuLingGG 大佬的 Actions 编译框架 项目：

https://github.com/SuLingGG/OpenWrt-Rpi
