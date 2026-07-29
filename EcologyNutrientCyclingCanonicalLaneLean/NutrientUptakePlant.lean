import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure PlantNutrientRequirement where
  nitrogenRequirement : ℝ
  phosphorusRequirement : ℝ
  potassiumRequirement : ℝ
  criticalConcentrations : Prop

structure RootUptakeKinetics where
  uptakeRate : ℝ
  michaelisConstant : ℝ
  maximumUptake : ℝ
  kineticsValid : Prop

structure NutrientUptakePackage where
  requirement : PlantNutrientRequirement
  kinetics : RootUptakeKinetics
  uptakeConstraint : Prop
  uptakeConstraintTerm : uptakeConstraint

structure NutrientUptakeEvidence (U : NutrientUptakePackage) where
  criticalConcentrationsClosed : U.requirement.criticalConcentrations
  kineticsValidClosed : U.kinetics.kineticsValid
  uptakeConstraintClosed : U.uptakeConstraint

def NutrientUptakeClosed (U : NutrientUptakePackage) : Prop :=
  U.requirement.criticalConcentrations ∧
  U.kinetics.kineticsValid ∧
  U.uptakeConstraint

theorem nutrient_uptake_closed_from_evidence
    (U : NutrientUptakePackage) (E : NutrientUptakeEvidence U) :
    NutrientUptakeClosed U := by
  exact And.intro E.criticalConcentrationsClosed
    (And.intro E.kineticsValidClosed E.uptakeConstraintClosed)

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse