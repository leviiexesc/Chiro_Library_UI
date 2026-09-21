# ✦ Chiro UI

> **A modern, lightweight & customizable UI library for Roblox.**

<p align="center">
  <strong>⚡ Clean UI • 🧩 Modular • 🎨 Customizable • 🚀 Lightweight</strong>
</p>

<p align="center">
  <a href="#-features">Features</a> •
  <a href="#-installation">Installation</a> •
  <a href="#-usage">Usage</a> •
  <a href="#-components">Components</a> •
  <a href="#-documentation">Docs</a>
</p>

---

## 🌌 About

**Chiro UI** is a modern UI library made for Roblox developers who want to build clean and interactive interfaces without creating every UI element from scratch.

Built with a focus on:

* ✦ Minimal & modern design
* ⚡ Fast UI creation
* 🎨 Easy customization
* 🧩 Reusable components
* 📱 Responsive layouts
* 🛠️ Developer-friendly APIs

> **Build your UI. Your way.**

---

## ✨ Features

| Feature               | Status |
| --------------------- | ------ |
| 🎨 Modern UI          | ✅      |
| 🌙 Dark Theme         | ✅      |
| ☀️ Light Theme        | ✅      |
| 🧩 Modular Components | ✅      |
| 🎚️ Toggle            | ✅      |
| 🔘 Button             | ✅      |
| 🎛️ Slider            | ✅      |
| 📝 Input              | ✅      |
| 📑 Tabs               | ✅      |
| 🔍 Search             | ✅      |
| 📜 Notifications      | ✅      |
| 💾 Config System      | 🚧     |
| 🎨 Custom Themes      | 🚧     |
| 📱 Responsive UI      | 🚧     |

---

## 📦 Installation

Load Chiro UI into your Roblox project:

```lua
local Chiro = loadstring(game:HttpGet(
    "YOUR_CHIRO_LIBRARY_URL"
))()
```

> Replace `YOUR_CHIRO_LIBRARY_URL` with the URL where you host your library.

---

# 🚀 Quick Start

```lua
local Chiro = loadstring(game:HttpGet(
    "YOUR_CHIRO_LIBRARY_URL"
))()

local Window = Chiro:CreateWindow({
    Title = "Chiro UI",
    Subtitle = "Modern Roblox Interface",
    Theme = "Dark"
})

local MainTab = Window:CreateTab({
    Name = "Main",
    Icon = "home"
})

MainTab:CreateButton({
    Name = "Hello World",
    Description = "Click me!",
    Callback = function()
        print("Hello from Chiro UI!")
    end
})
```

---

# 🧩 Components

### 🔘 Button

```lua
Tab:CreateButton({
    Name = "Example Button",
    Description = "A simple button",
    Callback = function()
        print("Button clicked!")
    end
})
```

### 🎚️ Toggle

```lua
Tab:CreateToggle({
    Name = "Example Toggle",
    Description = "Enable or disable something",
    Default = false,

    Callback = function(Value)
        print(Value)
    end
})
```

### 🎛️ Slider

```lua
Tab:CreateSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,

    Callback = function(Value)
        print("Value:", Value)
    end
})
```

### 📝 Input

```lua
Tab:CreateInput({
    Name = "Username",
    Placeholder = "Enter something...",

    Callback = function(Text)
        print(Text)
    end
})
```

---

# 🎨 Themes

Chiro UI is designed around a flexible theme system.

Example:

```lua
local Window = Chiro:CreateWindow({
    Title = "My Project",
    Theme = "Dark"
})
```

### Planned themes

```text
Dark
Light
Midnight
Ocean
Purple
Crimson
Custom
```

---

# 🔔 Notifications

```lua
Chiro:Notify({
    Title = "Chiro UI",
    Description = "Welcome to the interface!",
    Duration = 3
})
```

---

# 📑 Tabs

Create multiple sections to keep your interface organized.

```lua
local Combat = Window:CreateTab({
    Name = "Combat",
    Icon = "sword"
})

local Settings = Window:CreateTab({
    Name = "Settings",
    Icon = "settings"
})
```

---

# 🛠️ Project Structure

```text
Chiro/
│
├── src/
│   ├── Chiro.lua
│   ├── Components/
│   │   ├── Button.lua
│   │   ├── Toggle.lua
│   │   ├── Slider.lua
│   │   ├── Input.lua
│   │   └── Dropdown.lua
│   │
│   ├── Themes/
│   │   ├── Dark.lua
│   │   ├── Light.lua
│   │   └── Custom.lua
│   │
│   └── Utils/
│       ├── Animations.lua
│       ├── Signals.lua
│       └── Helpers.lua
│
├── examples/
│   └── Example.lua
│
├── docs/
│   └── API.md
│
├── LICENSE
└── README.md
```

---

# 🧠 Design Philosophy

Chiro isn't trying to make your project complicated.

The goal is simple:

```text
Developer
   ↓
Chiro UI
   ↓
Beautiful Interface
   ↓
Better Experience
```

Less boilerplate.

More customization.

Better UI.

---

# ⚡ Performance

Chiro UI is designed to stay lightweight.

### Goals

* Minimal unnecessary instances
* Reusable components
* Efficient animations
* Clean event connections
* Avoid unnecessary loops
* Simple API

> **Smooth UI > bloated UI**

---

# 📸 Preview

<p align="center">

### Chiro UI — Main Interface

`[ Add your screenshot here ]`

</p>

You can add screenshots like:

```md
![Chiro UI Preview](assets/preview.png)
```

---

# 🗺️ Roadmap

### v1.0

* [x] Core window
* [x] Tabs
* [x] Buttons
* [x] Toggles
* [x] Sliders
* [x] Inputs
* [x] Notifications

### v1.5

* [ ] Theme manager
* [ ] Config system
* [ ] Search
* [ ] Better animations
* [ ] More components

### v2.0

* [ ] Advanced customization
* [ ] Responsive layouts
* [ ] Component plugins
* [ ] Documentation website
* [ ] Developer tools

---

# 🤝 Contributing

Want to make Chiro better?

You're welcome to contribute.

```bash
git clone YOUR_REPOSITORY_URL
cd Chiro
```

Create a branch:

```bash
git checkout -b feature/my-feature
```

Make your changes, test them, and open a Pull Request.

---

# 📄 License

Chiro UI is released under the **MIT License**.

See [`LICENSE`](LICENSE) for more information.

---

# 💙 Chiro

Made for developers who care about their UI.

```text
   ╭──────────────────────╮
   │       CHIRO UI       │
   │                      │
   │   Build • Customize  │
   │   Create • Ship      │
   ╰──────────────────────╯
```

<p align="center">

**⭐ Star the repository if you like Chiro UI**

**🍴 Fork it • 🛠️ Build with it • 🚀 Make something cool**

</p>

---

<p align="center">
  <sub>Chiro UI • Modern Roblox UI Library</sub>
</p>
