({
	 onGroup: function(cmp, evt) {
		 var selected = evt.getSource().get("v.label");
		 var resultCmp = cmp.find("radioGroupResult");
		 resultCmp.set("v.value", selected);
	 }
})