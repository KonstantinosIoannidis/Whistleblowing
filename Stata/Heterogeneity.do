** Observation 2 **
reg whistle i.treatment##i.location risk svo gender age study if role == "employee", vce(cluster sessionlabel)
reg cheat i.treatment##i.location risk svo gender age study if role == "manager", vce(cluster sessionlabel)
