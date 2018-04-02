({
	onRadio: function(cmp, evt) {
		 var selected = evt.getSource().get("v.label");
		 var resultCmp = cmp.find("radioResult");
		 resultCmp.set("v.value", selected);
	 },
onGroup: function(cmp, evt) {
	         var selected = evt.getSource().get("v.label");
	         var resultCmp = cmp.find("radioGroupResult");
	         resultCmp.set("v.value", selected);
	     }
})