-- UI Demos Configuration
-- This loads the UI library demonstrations when needed

local M = {}

function M.setup()
  -- Load the UI demo files from the external project
  local ui_demo_path = "/Users/alialqattan/Projects/neovim-ui-testing"
  
  -- Check if the demo project exists
  if vim.fn.isdirectory(ui_demo_path) == 0 then
    vim.notify("UI Demo project not found at: " .. ui_demo_path, vim.log.levels.ERROR)
    return
  end
  
  -- Load the reactive framework first (this creates _G.react)
  local react_file = ui_demo_path .. "/react-implementation.lua"
  if vim.fn.filereadable(react_file) == 1 then
    dofile(react_file)
  else
    vim.notify("React implementation not found", vim.log.levels.ERROR)
    return
  end
  
  -- Initialize global namespace
  _G.UIDemo = {}
  
  -- Load demo modules (with error handling)
  local demo_files = {
    ui_demo_path .. "/lua/demos/nui_demo.lua",
    ui_demo_path .. "/lua/demos/guihua_demo.lua", 
    ui_demo_path .. "/lua/demos/nvim_react_demo.lua"
  }
  
  for _, file in ipairs(demo_files) do
    if vim.fn.filereadable(file) == 1 then
      local success, err = pcall(dofile, file)
      if not success then
        vim.notify("Error loading " .. file .. ": " .. err, vim.log.levels.ERROR)
      end
    else
      vim.notify("Demo file not found: " .. file, vim.log.levels.WARN)
    end
  end
  
  -- Main demo launcher function
  function UIDemo.launch_menu()
    local choices = {
      "1. NUI.nvim Demo (Popups, Inputs, Layouts)",
      "2. Guihua.lua Demo (ListView, TextView, Fuzzy Finder)",
      "3. Nvim-React Demo (Reactive Components)",
      "4. Exit"
    }
    
    vim.ui.select(choices, {
      prompt = "Select UI Library Demo:",
    }, function(choice)
      if not choice then return end
      
      if choice:match("^1%.") then
        UIDemo.nui.show_main_demo()
      elseif choice:match("^2%.") then
        UIDemo.guihua.show_main_demo()
      elseif choice:match("^3%.") then
        UIDemo.react.show_main_demo()
      end
    end)
  end
  
  -- Create the command
  vim.api.nvim_create_user_command('UIDemo', function()
    UIDemo.launch_menu()
  end, {
    desc = "Launch UI Library Demonstrations"
  })
  
  vim.notify("UI Library demos loaded! Run :UIDemo to start", vim.log.levels.INFO)
end

return M