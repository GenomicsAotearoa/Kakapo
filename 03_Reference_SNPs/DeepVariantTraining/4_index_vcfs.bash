for i in final_vcfs/*gz
do
	tabix -f $i
done
