# soulteary/homebrew-tap

soulteary 的个人 [Homebrew](https://brew.sh/) Tap,收录一些自用的命令行工具。

## 添加 Tap

```bash
brew tap soulteary/tap
```

添加后即可用 `brew install <formula>` 安装下列任意工具。

## 可用工具

| 工具 | 说明 | 版本 | 平台 | 项目主页 | 安装命令 |
| --- | --- | --- | --- | --- | --- |
| `splitdns` | 在 macOS 上安全地管理基于后缀(suffix)的 Split DNS 的命令行工具。 | `1.1.0` | macOS(arm64 / amd64) | [soulteary/splitdns](https://github.com/soulteary/splitdns) | `brew install soulteary/tap/splitdns` |
| `portmap` | 用 Go 实现的通用 TCP/UDP 端口转发小工具,无需依赖系统 `socat`。 | `1.2.0` | macOS / Linux(arm64 / amd64) | [soulteary/portmap](https://github.com/soulteary/portmap) | `brew install soulteary/tap/portmap` |
| `otterio` | 兼容 S3 协议的对象存储服务。 | — | macOS / Linux(arm64 / amd64 / ppc64le) | [soulteary/otterio](https://github.com/soulteary/otterio) | `brew install soulteary/tap/otterio` |
| `ssh-config` | 管理 SSH 配置,支持与 YAML/JSON 相互转换。 | `3.1.0` | macOS / Linux(arm64 / amd64) | [soulteary/ssh-config](https://github.com/soulteary/ssh-config) | `brew install soulteary/tap/ssh-config` |
| `nginx-formatter` | 小巧易用的 Nginx 配置格式化工具(CLI & WebUI),体积约 10MB。 | `2.3.0` | macOS / Linux(arm64 / amd64) | [soulteary/nginx-formatter](https://github.com/soulteary/nginx-formatter) | `brew install soulteary/tap/nginx-formatter` |
| `grantseal` | 基于 Ed25519 的零依赖离线软件授权协议与 CLI(签发端 `license-tool`)。 | `1.1.0` | macOS / Linux(arm64 / amd64) | [soulteary/grantseal](https://github.com/soulteary/grantseal) | `brew install soulteary/tap/grantseal` |
| `webhook` | 面向自托管和边缘环境的安全、可观测 webhook-to-command runner。 | `7.1.0` | macOS / Linux | [soulteary/webhook](https://github.com/soulteary/webhook) | `brew install soulteary/tap/webhook` |

## 可用桌面应用(Cask)

| 应用 | 说明 | 版本 | 平台 | 项目主页 | 安装命令 |
| --- | --- | --- | --- | --- | --- |
| `kakapo` | 更聪明的跨语言桌面翻译器,支持多服务商、多模型、多目标语言并行对比。 | `2026.08.09` | macOS(universal) | [soulteary/kakapo](https://github.com/soulteary/kakapo) | `brew install --cask soulteary/tap/kakapo` |

## 卸载

```bash
brew uninstall <formula>
brew uninstall --cask <cask>
brew untap soulteary/tap
```

## License

各工具遵循其各自仓库中的许可证,本 Tap 仓库以 [Apache-2.0](./LICENSE) 授权。
