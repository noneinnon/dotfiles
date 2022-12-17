local N = {
  notesDir = os.getenv("NOTES_DIR")
}

function N.openNotes(command, path)
  command = command or "e"
  path = path or "/"
  if N.notesDir then
    vim.cmd(command .. N.notesDir .. path)
  else
    vim.notify('Notes Dir is not defined')
  end
end

return N
