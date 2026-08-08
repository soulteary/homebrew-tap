# soulteary/homebrew-tap

soulteary 的个人 [Homebrew](https://brew.sh/) Tap,收录一些自用的命令行工具。

## 添加 Tap

```bash
brew tap soulteary/tap
```

添加后即可用 `brew install <formula>` 安装下列任意工具。

## 可用工具

### splitdns

在 macOS 上安全地管理基于后缀(suffix)的 Split DNS 的命令行工具。

- 版本:`1.1.0`
- 平台:macOS(arm64 / amd64)
- 项目主页:<https://github.com/soulteary/splitdns>

安装:

```bash
brew install soulteary/tap/splitdns
```

验证:

```bash
splitdns version
# splitdns 1.1.0 (commit 7c7c360a0ee8eac29e78b628c1fe3529885d9999, built 2026-08-08T15:30:15Z, go1.26.5 darwin/arm64)
```

### otterio

兼容 S3 协议的对象存储服务。

- 平台:macOS / Linux(arm64 / amd64 / ppc64le)
- 项目主页:<https://github.com/soulteary/otterio>

安装:

```bash
brew install soulteary/tap/otterio
```

### ssh-config

管理 SSH 配置,支持与 YAML/JSON 相互转换。

- 版本:`2.0.0`
- 平台:macOS / Linux(arm64 / amd64)
- 项目主页:<https://github.com/soulteary/ssh-config>

安装:

```bash
brew install soulteary/tap/ssh-config
```

## 卸载

```bash
brew uninstall <formula>
brew untap soulteary/tap
```

## License

各工具遵循其各自仓库中的许可证,本 Tap 仓库以 [Apache-2.0](./LICENSE) 授权。
