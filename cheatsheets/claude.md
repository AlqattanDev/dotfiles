# 🤖 Claude AI Tools Cheatsheet

Configuration for Claude Code (TUI) and Claude Desktop applications.

## 🚀 Quick Access
| Command | Action |
|---------|--------|
| `claude` | Launch Claude CLI |
| Open Claude Desktop app | GUI interface |

## 📁 Configuration Locations
- **Claude Code (TUI)**: `~/.config/ratatui-claude-code/`
- **Claude Desktop**: `~/.config/claude_prompts/`

## 🔧 Claude Code (Terminal UI)

### Features
- **Terminal-based interface** for Claude AI
- **Code-focused interactions** optimized for development
- **Syntax highlighting** for code blocks
- **Project context awareness**

### Configuration
Location: `~/.config/ratatui-claude-code/config.toml`

```toml
# Example configuration
[ui]
theme = "dark"
editor = "nvim"

[ai]
model = "claude-3-sonnet"
temperature = 0.7

[keybindings]
quit = "q"
send = "Enter"
clear = "Ctrl+l"
```

### Usage Tips
- Use for code reviews and explanations
- Great for debugging assistance
- Excellent for architecture discussions
- Integrates well with terminal workflow

## 🖥️ Claude Desktop

### Features
- **Rich GUI interface** with full formatting
- **File upload support** for documents and images
- **Conversation history** with search
- **Multiple conversation threads**

### Configuration
Location: `~/.config/claude_prompts/system_prompts.yaml`

```yaml
# Custom system prompts
prompts:
  coding:
    name: "Coding Assistant"
    prompt: "You are an expert software developer..."
  
  writing:
    name: "Writing Helper"
    prompt: "You are a professional writer..."
  
  analysis:
    name: "Data Analyst"
    prompt: "You are a data analysis expert..."
```

## 🎯 Integration with Development Workflow

### With Neovim
```bash
# Use Claude for code explanation
# Select code in Neovim, then:
:'<,'>w !claude explain
```

### With Git
```bash
# Get commit message suggestions
git diff --cached | claude "Suggest a commit message for these changes"
```

### With Terminal
```bash
# Quick code review
cat myfile.py | claude "Review this code for potential issues"

# Architecture advice
claude "How should I structure a REST API in Python?"
```

## 🔧 Environment Variables
```bash
# Claude Code configuration
export CLAUDE_CODE_ENABLE_TELEMETRY=1
export CLAUDE_CODE_CONFIG_PATH="~/.config/ratatui-claude-code"

# API configuration (if using API directly)
export ANTHROPIC_API_KEY="your-api-key-here"
```

## 🎨 Customization Options

### Claude Code (TUI)
- **Themes**: Dark, light, custom color schemes
- **Keybindings**: Vim-style or custom mappings
- **Editor integration**: Works with any terminal editor
- **Output formatting**: Syntax highlighting, markdown rendering

### Claude Desktop
- **System prompts**: Custom AI personalities
- **Conversation templates**: Pre-defined conversation starters
- **File handling**: Automatic file type detection
- **Export options**: Save conversations in various formats

## 💡 Workflow Examples

### Code Review Workflow
```bash
# 1. Stage your changes
git add .

# 2. Get AI review
git diff --cached | claude "Please review this code for:"
# - Potential bugs
# - Performance issues  
# - Best practices
# - Security concerns

# 3. Apply suggestions and commit
git commit -m "$(git diff --cached | claude 'Suggest a concise commit message')"
```

### Documentation Workflow
```bash
# Generate documentation
claude "Create documentation for this function:" < myfunction.py

# Explain complex code
claude "Explain this algorithm step by step:" < algorithm.py

# Create README
claude "Create a README.md for this project:" < project_structure.txt
```

### Learning Workflow
```bash
# Understand new concepts
claude "Explain dependency injection in Python with examples"

# Code alternatives
claude "Show me 3 different ways to implement this:" < mycode.py

# Best practices
claude "What are the best practices for error handling in this code:" < error_handling.py
```

## 🔧 Advanced Configuration

### Custom Prompts
Create specialized prompts for different tasks:

```yaml
# ~/.config/claude_prompts/system_prompts.yaml
prompts:
  code_reviewer:
    name: "Code Reviewer"
    prompt: |
      You are a senior software engineer conducting a code review.
      Focus on:
      - Code quality and maintainability
      - Performance implications
      - Security vulnerabilities
      - Best practices adherence
      
  architect:
    name: "System Architect"
    prompt: |
      You are a system architect helping design software systems.
      Consider:
      - Scalability requirements
      - Technology trade-offs
      - Design patterns
      - System integration
```

### Integration Scripts
```bash
#!/bin/bash
# ~/.local/bin/claude-review
# Quick code review script

if [ -z "$1" ]; then
    echo "Usage: claude-review <file>"
    exit 1
fi

cat "$1" | claude "Review this code for potential improvements, bugs, and best practices. Provide specific, actionable feedback."
```

## 🎯 Use Cases

### Development
- **Code review** and quality assessment
- **Bug hunting** and debugging assistance
- **Architecture** planning and design
- **Documentation** generation
- **Test case** creation

### Learning
- **Concept explanation** for new technologies
- **Code walkthrough** for complex algorithms
- **Best practices** guidance
- **Technology comparison** and selection

### Productivity
- **Commit message** generation
- **Code refactoring** suggestions
- **Performance optimization** advice
- **Security audit** assistance

## 🔧 Troubleshooting
| Issue | Solution |
|-------|----------|
| **Claude not responding** | Check internet connection and API limits |
| **Config not loading** | Verify file paths and permissions |
| **Poor responses** | Refine prompts and provide more context |
| **Slow performance** | Check system resources and network |

## 💡 Pro Tips
- **Provide context**: Include relevant code and project information
- **Be specific**: Ask targeted questions for better responses
- **Iterate**: Refine prompts based on response quality
- **Combine tools**: Use both TUI and Desktop for different tasks
- **Save good prompts**: Build a library of effective prompts
- **Version control**: Keep prompt configurations in your dotfiles

## 🔄 Updates and Maintenance
```bash
# Update Claude Code
brew upgrade claude-code  # or your installation method

# Backup configurations
cp -r ~/.config/ratatui-claude-code ~/.config/ratatui-claude-code.backup
cp -r ~/.config/claude_prompts ~/.config/claude_prompts.backup

# Sync configurations (already handled by dotfiles)
cd ~/dotfiles && jj describe -m "Update Claude configurations"
```

Your Claude AI tools are configured to enhance your development workflow with intelligent assistance!
