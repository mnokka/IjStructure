
This formula calculates project EPIC hour budget status compared estimated, badly estimated or not estimated at all cases
(Epic estimation vs. Epic + children estimates vs. No Epic estimmation but children estimations exist vs. None estimations)

----------------

if(type='epic';

WITH def_origest=DEFAULT (originalestimate,0):
WITH EpicEstOK=originalestimate-sum#children{timespent}-timespent:
WITH NoEpicEstUseChildrens=((sum#children{originalestimate})-(sum#children{timespent})-timespent):
WITH ChildrenEstBiggerThanEpics=((sum#children{originalestimate})-sum#children{timespent}):
WITH ChildrenEstimates=((sum#children{originalestimate})):
WITH ChilrenEstAndEpicEst=((sum#children{originalestimate})+originalestimate):
WITH UseChildrenEstAndEpicEst=ChilrenEstAndEpicEst-(sum#children{timespent})-timespent:

if (def_origest > 0 AND def_origest >= ChilrenEstAndEpicEst ; EpicEstOK; def_origest = 0; NoEpicEstUseChildrens; def_origest > 0 AND def_origest < ChilrenEstAndEpicEst ; UseChildrenEstAndEpicEst;  "GIVING UP"))
