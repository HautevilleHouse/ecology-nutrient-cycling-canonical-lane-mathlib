import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure NutrientBudgetObject where
  ecosystemType : Type
  inputs : ℝ
  outputs : ℝ
  internalCycling : ℝ
  storageChange : ℝ
  budgetEquationSatisfied : Prop
  temporalScale : ℝ
  spatialExtent : Set ecosystemType

structure NutrientBudgetEvidence (B : NutrientBudgetObject) where
  budgetEquationClosed : B.budgetEquationSatisfied
  inputsMeasured : B.inputs > 0
  outputsMeasured : B.outputs > 0
  internalCyclingMeasured : B.internalCycling > 0

def NutrientBudgetClosed (B : NutrientBudgetObject) : Prop :=
  B.budgetEquationSatisfied ∧
  B.inputs > 0 ∧
  B.outputs > 0 ∧
  B.internalCycling > 0

theorem nutrient_budget_closed_from_evidence (B : NutrientBudgetObject)
    (E : NutrientBudgetEvidence B) : NutrientBudgetClosed B := by
  exact And.intro E.budgetEquationClosed
    (And.intro E.inputsMeasured
      (And.intro E.outputsMeasured E.internalCyclingMeasured))

def NutrientBudgetAdmittedObject where
  object : NutrientBudgetObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

structure AdmissibleClass where
  object : NutrientBudgetAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NutrientBudgetClosed A.object.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse