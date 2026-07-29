import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure MassBalanceConstraintPackage where
  totalInput : ℝ
  totalOutput : ℝ
  stockChange : ℝ
  massConservation : Prop
  closureUnderFluxes : Prop
  sourceSinkBalance : Prop

structure MassBalanceConstraintEvidence (M : MassBalanceConstraintPackage) where
  massConservationClosed : M.massConservation
  closureUnderFluxesClosed : M.closureUnderFluxes
  sourceSinkBalanceClosed : M.sourceSinkBalance

def MassBalanceConstraintClosed (M : MassBalanceConstraintPackage) : Prop :=
  M.massConservation ∧ M.closureUnderFluxes ∧ M.sourceSinkBalance

theorem mass_balance_constraint_closed_from_evidence (M : MassBalanceConstraintPackage) (E : MassBalanceConstraintEvidence M) : MassBalanceConstraintClosed M := by
  exact And.intro E.massConservationClosed (And.intro E.closureUnderFluxesClosed E.sourceSinkBalanceClosed)

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse