import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure StoichiometryPackage where
  elementSet : Type u
  compoundSet : Type v
  ratioMap : compoundSet → (elementSet → ℚ)
  fixedRatios : Prop
  limitingFactorLaw : Prop

structure StoichiometryEvidence (S : StoichiometryPackage) where
  fixedRatiosClosed : S.fixedRatios
  limitingFactorLawClosed : S.limitingFactorLaw

def StoichiometryClosed (S : StoichiometryPackage) : Prop :=
  S.fixedRatios ∧ S.limitingFactorLaw

theorem stoichiometry_closed_from_evidence (S : StoichiometryPackage)
    (E : StoichiometryEvidence S) : StoichiometryClosed S := by
  exact And.intro E.fixedRatiosClosed E.limitingFactorLawClosed

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse