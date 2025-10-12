@Echo off
catpck -a ../cutscenes/8*.xml ../07.cat::addon2/cutscenes/
catpck -a ../cutscenes/CSV*.xml ../07.cat::addon2/cutscenes/
catpck -a ../cutscenes/Goner*.xml ../07.cat::addon2/cutscenes/
catpck -a ../cutscenes/Khaak*.xml ../07.cat::addon2/cutscenes/
catpck -a ../cutscenes/L2M024_Cut1.xml ../07.cat::addon2/cutscenes/
catpck -a ../cutscenes/Terran*.xml ../07.cat::addon2/cutscenes/
catpck -a ../cutscenes/Version*.xml ../07.cat::addon2/cutscenes/
catpck -a "../director/1.40 *.xml" ../07.cat::addon2/director/
catpck -a "../director/3.02 *.xml" ../07.cat::addon2/director/
catpck -a "../director/3.05 *.xml" ../07.cat::addon2/director/
catpck -a "../director/3.06 *.xml" ../07.cat::addon2/director/
catpck -a "../director/3.09 *.xml" ../07.cat::addon2/director/
catpck -a ../director/AP_DoubleAgent.xml ../07.cat::addon2/director/
catpck -a ../director/CSV_*.xml ../07.cat::addon2/director/
catpck -a ../director/2.0*.xml ../07.cat::addon2/director/
catpck -a ../director/Reunion*.xml ../07.cat::addon2/director/
catpck -a ../director/start_oldplot.xml ../07.cat::addon2/director/
catpck -a ../maps/oldplots/*.xml ../07.cat::addon2/maps/
catpck -a ../types/*.txt ../09.cat::addon2/types/
catpck -a ../types/*.xml ../09.cat::addon2/types/
catpck -a ../maps/*.xml ../09.cat::addon2/maps/
catpck -a ../cutscenes/LC_*.xml ../09.cat::addon2/cutscenes/
catpck -a ../cutscenes/Beryll_*.xml ../09.cat::addon2/cutscenes/
catpck -a ../cutscenes/Reunion_*.xml ../09.cat::addon2/cutscenes/
catpck -a ../director/images/* ../09.cat::addon2/director/images/
catpck -a ../director/OBS.xml ../09.cat::addon2/director/
catpck -a ../director/SRST.xml ../09.cat::addon2/director/
catpck -a "../director/0.35 Defend Object.xml" ../09.cat::addon2/director/
catpck -a ../director/2.1*.xml ../09.cat::addon2/director/
catpck -a "../director/3.01 *.xml" ../09.cat::addon2/director/
catpck -a "../director/3.10 *.xml" ../09.cat::addon2/director/
catpck -a "../director/u.6 *.xml" ../09.cat::addon2/director/
catpck -a ../t/0002* ../09.cat::addon2/t/
catpck -a ../t/0004* ../09.cat::addon2/t/
catpck -a ../t/9620* ../09.cat::addon2/t/
catpck -a ../t/conversations.xml ../09.cat::addon2/t/
catpck -a ../t/conversations_guilds.xml ../09.cat::addon2/t/
catpck -a --recursive ../CAT/08/* ../08.cat
catpck -a --recursive ../CAT/09/* ../09.cat
spktool -createscript guilds.sps