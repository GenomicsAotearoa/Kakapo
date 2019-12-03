for i in final_vcfs/*gz
do
	tabix $i
done
