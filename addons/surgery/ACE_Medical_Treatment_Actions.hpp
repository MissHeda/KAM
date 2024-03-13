class ACE_Medical_Treatment_Actions {
    class BasicBandage;
    class CheckPulse;
    class ApplyTourniquet;
    class ApplyTourniquet: BasicBandage {
        condition = QUOTE(!([ARR_2(_patient,_bodyPart)] call ACEFUNC(medical_treatment,hasTourniquetAppliedTo)) && ([ARR_2(_patient,_bodyPart)] call FUNC(hasAdditionalTourniquetAppliedTo)));
    };
    class RemoveTourniquet: ApplyTourniquet {
        condition = QUOTE(([ARR_2(_patient,_bodyPart)] call ACEFUNC(medical_treatment,hasTourniquetAppliedTo)) && ([ARR_2(_patient,_bodyPart)] call FUNC(hasAdditionalTourniquetAppliedTo)));
    };
    class CheckFracture: CheckPulse {
        displayName = CSTRING(fracture_check);
        displayNameProgress = CSTRING(fracture_checking);
        category = "examine";
        treatmentLocations = 0;
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = QGVAR(enable_selfCheckFracture);
        medicRequired = QGVAR(fractureCheck_MedLevel);
        treatmentTime = QGVAR(fractureCheck_Time);
        items[] = {};
        condition = QUOTE(([ARR_4(_medic,_patient,_bodyPart,5)] call FUNC(fractureCheck)) && (GVAR(enable_fracture)));
        callbackSuccess = QFUNC(fractureSelect);
    };
    class ClosedReduction: CheckFracture {
        displayName = CSTRING(fracture_closed);
        displayNameProgress = CSTRING(perform);
        category = "surgery";
        treatmentLocations = QGVAR(closedLocation);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(closedReduction_MedLevel);
        treatmentTime = QGVAR(closedTime);
        items[] = {};
        condition = QUOTE([ARR_4(_medic,_patient,_bodyPart,1)] call FUNC(fractureCheck));
        callbackSuccess = QFUNC(closedReduction);
    };
    class OpenReduction: CheckFracture {
        displayName = CSTRING(fracture_open);
        displayNameProgress = CSTRING(perform);
        category = "surgery";
        treatmentLocations = QGVAR(surgicalLocation);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(surgicalAction_MedLevel);
        treatmentTime = QGVAR(openTime);
        items[] = {"kat_plate"};
        consumeItem = 1;
        condition = QUOTE([ARR_4(_medic,_patient,_bodyPart,3.5)] call FUNC(openReductionCheck));
        callbackSuccess = QFUNC(openReduction);
    };
    class Expose: BasicBandage {
        displayName = CSTRING(Retractor_Use);
        displayNameProgress = CSTRING(Retractor_Action);
        category = "surgery";
        treatmentLocations = QGVAR(surgicalLocation);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(surgicalAction_MedLevel);
        treatmentTime = QGVAR(intermediateTime);
        items[] = {"kat_retractor"};
        condition = QUOTE([ARR_4(_medic,_patient,_bodyPart,2.1)] call FUNC(openReductionCheck));
        consumeItem = 0;
        callbackSuccess = QUOTE([ARR_4(_medic,_patient,_bodyPart,2.1)] call FUNC(openReductionProgress));
    };
    class Incision: BasicBandage {
        displayName = CSTRING(Scalpel_Use);
        displayNameProgress = CSTRING(perform);
        category = "surgery";
        treatmentLocations = QGVAR(surgicalLocation);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(surgicalAction_MedLevel);
        treatmentTime = QGVAR(incisionTime);
        items[] = {"kat_scalpel"};
        condition = QUOTE([ARR_4(_medic,_patient,_bodyPart,5)] call FUNC(openReductionCheck));
        callbackSuccess = QFUNC(incision);
    };
    class Clamp: BasicBandage {
        displayName = CSTRING(Clamp_Use);
        displayNameProgress = CSTRING(Clamp_Action);
        category = "surgery";
        treatmentLocations = QGVAR(surgicalLocation);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(surgicalAction_MedLevel);
        treatmentTime = QGVAR(intermediateTime);
        items[] = {"kat_clamp"};
        condition = QUOTE([ARR_4(_medic,_patient,_bodyPart,3.3)] call FUNC(openReductionCheck));
        consumeItem = 0;
        callbackSuccess = QUOTE([ARR_4(_medic,_patient,_bodyPart,3.3)] call FUNC(openReductionProgress));
    };
    class Irrigate: BasicBandage {
        displayName = CSTRING(Irrigate_Use);
        displayNameProgress = CSTRING(Irrigate_Action);
        category = "surgery";
        treatmentLocations = QGVAR(surgicalLocation);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(surgicalAction_MedLevel);
        treatmentTime = QGVAR(intermediateTime);
        items[] = {"ACE_salineIV_250"};
        condition = QUOTE([ARR_4(_medic,_patient,_bodyPart,2.3)] call FUNC(openReductionCheck));
        callbackSuccess = QUOTE([ARR_4(_medic,_patient,_bodyPart,2.3)] call FUNC(openReductionProgress));
    };
    class NPWT: BasicBandage {
        displayName = CSTRING(Vacuum_Use);
        displayNameProgress = CSTRING(Vacuum_Action);
        condition = QFUNC(canNPWT);
        category = "surgery";
        allowedSelections[] = {"All"};
        allowSelfTreatment = 0;
        treatmentLocations = QGVAR(npwtLocation);
        treatmentTime = QFUNC(getNPWTTime);
        medicRequired = QGVAR(npwtMedLevel);
        items[] = {"kat_vacuum"};
        sounds[] = {{QPATHTO_R(sounds\vacuum.ogg),8,1,15}};
        consumeItem = 0;
        callbackProgress = QFUNC(npwtTreatmentProgress);
        callbackSuccess = "";
    };
    class Ultrasound: BasicBandage {
        displayName = CSTRING(Ultra_Use);
        displayNameProgress = CSTRING(Ultra_Action);
        category = "surgery";
        treatmentLocations = QGVAR(surgicalLocation);
        allowedSelections[] = {"Body"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(surgicalAction_MedLevel);
        treatmentTime = QGVAR(intermediateTime);
        items[] = {"kat_ultrasound"};
        condition = "";
        consumeItem = 0;
        callbackSuccess = QFUNC(ultraAssessment);
    };
    class ReboaPlacement: BasicBandage {
        displayName = CSTRING(Reboa_Use);
        displayNameProgress = CSTRING(Reboa_Action);
        category = "surgery";
        treatmentLocations = QGVAR(surgicalLocation);
        allowedSelections[] = {"LeftLeg", "RightLeg"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(surgicalAction_MedLevel);
        treatmentTime = QGVAR(intermediateTime);
        items[] = {"kat_reboa"};
        condition = QUOTE((_patient getVariable [ARR_2(QQGVAR(imaging),false)]) && (!(_patient getVariable [ARR_2(QQGVAR(reboa),false)])));
        consumeItem = 1;
        callbackSuccess = QFUNC(reboaApply);
    };
    class ReboaAdvancement: ReboaPlacement {
        displayName = CSTRING(Reboa_Deep_Use);
        displayNameProgress = CSTRING(Reboa_Deep_Action);
        category = "surgery";
        treatmentLocations = QGVAR(surgicalLocation);
        allowedSelections[] = {"LeftLeg", "RightLeg"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(surgicalAction_MedLevel);
        treatmentTime = QGVAR(intermediateTime);
        items[] = {"kat_ultrasound"};
        condition = QUOTE(_patient getVariable [ARR_2(QQGVAR(reboa),false)]);
        consumeItem = 0;
        callbackSuccess = QFUNC(reboaDeepApply);
    };
    class ReboaRemoval: ReboaPlacement {
        displayName = CSTRING(Reboa_Remove_Use);
        displayNameProgress = CSTRING(Reboa_Remove_Action);
        category = "surgery";
        treatmentLocations = QGVAR(reboaTime);
        allowedSelections[] = {"LeftLeg", "RightLeg"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(surgicalAction_MedLevel);
        treatmentTime = QGVAR(intermediateTime);
        items[] = {"kat_ultrasound"};
        condition = QUOTE(_patient getVariable [ARR_2(QQGVAR(reboa),false)]);
        consumeItem = 0;
        callbackSuccess = QFUNC(reboaRemove);
    };
    class PericardialTap: ReboaPlacement {
        displayName = CSTRING(Pericardial_Tap_Use);
        displayNameProgress = CSTRING(Pericardial_Tap_Action);
        category = "surgery";
        treatmentLocations = QGVAR(surgicalLocation);
        allowedSelections[] = {"Body"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(surgicalAction_MedLevel);
        treatmentTime = QGVAR(intermediateTime);
        items[] = {"kat_ultrasound"};
        condition = QUOTE(_patient getVariable [ARR_2(QQGVAR(imaging),false)]);
        consumeItem = 0;
        callbackSuccess = QFUNC(pericardialTap);
    };
};
