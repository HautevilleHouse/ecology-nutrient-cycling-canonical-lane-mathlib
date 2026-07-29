import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure LeachingProcess where
  soilWaterFlux : ℝ
  nutrientConcentrationSoil : ℝ
  leachingCoefficient : ℝ
  depthFactor : ℝ
  leachingEquation : Prop
  parameterBounds : Prop

structure LeachingLoss where
  nitrogenLoss : ℝ
  phosphorusLoss : ℝ
  totalLoss : ℝ
  lossesConsistent : Prop

structure NutrientLeachingPackage where
  process : LeachingProcess
  loss : LeachingLoss
  lossConstraint : Prop
  lossConstraintTerm : lossConstraint

structure NutrientLeachingEvidence (L : NutrientLeachingPackage) where
  leachingEquationClosed : L.process.leachingEquation
  parameterBoundsClosed : L.process.parameterBounds
  lossesConsistentClosed : L.loss.lossesConsistent
  lossConstraintClosed : L.lossConstraint

def NutrientLeachingClosed (L : NutrientLeachingPackage) : Prop :=
  L.process.leachingEquation ∧
  L.process.parameterBounds ∧
  L.loss.lossesConsistent ∧
  L.lossConstraint

theorem nutrient_leaching_closed_from_evidence
    (L : NutrientLeachingPackage) (E : NutrientLeachingEvidence L) :
    NutrientLeachingClosed L := by
  exact And.intro E.leachingEquationClosed
    (And.intro E.parameterBoundsClosed
      (And.intro E.lossesConsistentClosed E.lossConstraintClosed))

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse