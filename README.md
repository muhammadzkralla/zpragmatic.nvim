# zpragmatic.nvim

[Demo](https://github.com/user-attachments/assets/59425e2a-f6f4-4ccf-a417-65fc7c2343e0)

## Introduction

### The Pragmatic NeoVim Plugin

`zpragmatic.nvim` prompts you with alert dialog questions whenever you attempt to save changes in a file. If any question fails, the save operation is aborted, and you are returned to the buffer to make adjustments. You can configure different questions for various file types, apply questions universally, and exempt specific file types from any prompts.

## Inspiration

This plugin is inspired by the [*The Pragmatic Programmer book (20th anniversary edition)*](https://en.wikipedia.org/wiki/The_Pragmatic_Programmer), specifically from Chapter 2, Page 30. The book advises:

```text
Many editors have support (either built-in or via extensions) to run commands when you save a file. 
Get your editor to popup an ETC? message every time you save and use it as a cue to think about the code 
you just wrote. Is it easy to change?
```

This idea is specifically tied to the [ETC principle](https://www.birkey.co/2020-12-26-ETC-principle-to-ground-all.html), but it can be generalized as a reminder to alert your future self not to break certain rules after editing a file or making small changes.

When coding, you often enter a flow state, where you focus solely on the task at hand. In this state, it's easy to forget about other important considerations. Once you're done with your task, you may skip asking yourself critical questions and directly submit your changes.

The goal of this plugin is to help you stay mindful of these rules, even when you're in the flow.

## Installation and Configuration

### Using [Lazy.nvim](https://github.com/folke/lazy.nvim)

To install `zpragmatic.nvim` with Lazy.nvim, add the following to your `init.lua` or `config.lua`:

```lua
return {
    "muhammadzkralla/zpragmatic.nvim",
    version = "1.0.2",
    config = function()
        require("zpragmatic").setup({
            filetype_questions = {
                ["*"] = { -- Questions for any file type
                    "Don't break any windows.",
                    "Don't violate the DRY principle.",
                    "Don't violate the ETC principle.",
                    "Comment your code.",
                    "Ensure your code is easy to change.",
                    "Avoid code duplication.",
                    "Run tests before saving.",
                },
                ["java"] = { -- Questions for Java file types
                    "All maven tests must pass before you save.",
                    "Ensure code is properly indented and formatted.",
                    "Check for potential null pointer exceptions.",
                    "All public methods should have proper documentation.",
                },
                ["javascript"] = { -- Questions for JavaScript file types
                    "Run the linter.",
                    "Add jsdocs for all functions.",
                    "Ensure there are no console logs left in the code.",
                    "Verify no unused variables exist.",
                    "Test the code in multiple browsers if necessary.",
                },
                ["python"] = { -- Questions for Python file types
                    "All tests must pass before saving.",
                    "Follow PEP 8 coding standards.",
                    "Ensure all functions are properly documented.",
                    "Check for any unused imports.",
                    "Run `black` to format your code.",
                },
                ["html"] = { -- Questions for HTML file types
                    "Check for unclosed tags.",
                    "Ensure all images have alt attributes.",
                    "Validate your HTML with the W3C validator.",
                },
                ["css"] = { -- Questions for CSS file types
                    "Check for unused CSS rules.",
                    "Ensure all CSS classes are named meaningfully.",
                    "Ensure consistency in indentation.",
                },
                ["go"] = { -- Questions for Go file types
                    "Ensure all tests pass using `go test`.",
                    "Run `gofmt` to format your code.",
                    "Check for unnecessary dependencies.",
                },
                ["ruby"] = { -- Questions for Ruby file types
                    "All tests should pass using `rspec`.",
                    "Follow the Ruby style guide.",
                    "Ensure code is well-optimized and readable.",
                },
                ["rust"] = { -- Questions for Rust file types
                    "All tests should pass using `cargo test`.",
                    "Check for unused code and dependencies.",
                    "Run `cargo fmt` to format your code.",
                },
            },
            bypass_filetypes = { "markdown", "txt", "text", "plain", "json" }, -- List of file types that should bypass the prompt
        })
    end,
}

```

If you use Packer, you can install it as follows:

```lua
use {
    "muhammadzkralla/zpragmatic.nvim",
    config = function()
        require("zpragmatic").setup({
            filetype_questions = {
                ["*"] = {
                    "Save changes? (y/n/q): ",
                },
                ["python"] = {
                    "Have you run the tests? (y/n/q): ",
                },
            },
            bypass_filetypes = { "markdown", "txt", "json" },
        })
    end,
}
```

> **Note:** 
> The universal questions are asked before the specific questions, i.e. in Java for example, it would ask the general questions first, then ask the Java-specific questions.
