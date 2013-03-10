$ () ->
  checkAll = $("input#check-all")
  checkAllTargets = checkAll.attr "data-targets"
  checkAll.click () ->
    $t = $(this) 
    checked = $t.prop 'checked' 
    $("input:checkbox[name='"+checkAllTargets+"[]']").each () -> 
      this.checked = checked
      return
    return
  $("#delete-all-link").click () ->
    $t = $(this)
    href = $t.attr("href")
    href = href.substr 0, href.indexOf('?') if href.indexOf('?') > -1
    params = $("#tbl-form").serialize()
    if params
      $t.prop "href",href + '?' + params 
    else
      alert '请选择操作记录!'
      false
