#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub OpenDocument(item As FolderItem)
		  dim wnd as new WndEditor
		  wnd.OpenDocument item
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
			dim dlg as new OpenDialog
			dlg.PromptText = "Select a XojoScript document:"
			dlg.Filter = DocumentTypes.XojoScript
			
			dim f as FolderItem = dlg.ShowModal
			if f IsA FolderItem then
			OpenDocument f
			end if
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim f as FolderItem = App.ExecutableFile.Parent
			  
			  #if TargetMacOS then
			    f = f.Parent.Child( "Resources" )
			  #else
			    f = f.Child( "Resources" )
			  #endif
			  
			  return f
			End Get
		#tag EndGetter
		ResourcesFolder As FolderItem
	#tag EndComputedProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
