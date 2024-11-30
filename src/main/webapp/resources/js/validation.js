function CheckAddItem() {
    const form = document.forms['newItem'];
    if (!form) return false;

    const itemId = form.itemId;
    const name = form.name;
    const unitPrice = form.unitPrice;
    const description = form.description;
    const unitsInStock = form.unitsInStock;
    const category = form.category;

    // 상품 코드 체크
    function checkProductId(itemId) {
        const patterns = {
            'BN': /^BN[0-9]{3}$/,
            'HT': /^HT[0-9]{3}$/,
            'CM': /^CM[0-9]{3}$/,
            'GR': /^GR[0-9]{3}$/,
            'CP': /^CP[0-9]{3}$/
        };
        
        const prefix = itemId.substring(0, 2);
        return patterns[prefix] && patterns[prefix].test(itemId);
    }

    // 상품코드 체크
    if (!itemId.value || !checkProductId(itemId.value)) {
        alert("[상품 코드]\n상품코드와 숫자를 조합하여 5자리를 입력하세요\n첫 글자는 반드시 상품코드로 시작하세요\n" 
              + "BN: Bean (원두)\nHT: Herb Tea (허브차)\nCM: Coffee Machine(커피머신)\n"
              + "GR: Grinder (그라인더)\nCP: Cup (컵)");
        itemId.focus();
        return false;
    }

    // 상품명 체크
    if (!name.value || name.value.trim().length < 4 || name.value.length > 30) {
        alert("[상품명]\n최소 4자에서 최대 30자까지 입력하세요");
        name.focus();
        return false;
    }

    // 가격 체크
    if (!unitPrice.value || isNaN(unitPrice.value)) {
        alert("[가격]\n숫자만 입력하세요");
        unitPrice.focus();
        return false;
    }

    if (parseInt(unitPrice.value) < 0) {
        alert("[가격]\n음수를 입력할 수 없습니다");
        unitPrice.focus();
        return false;
    }

    // 재고 수 체크
    if (!unitsInStock.value || isNaN(unitsInStock.value)) {
        alert("[재고 수]\n숫자만 입력하세요");
        unitsInStock.focus();
        return false;
    }

    // 상세 설명 체크
    if (!description.value || description.value.trim().length < 30) {
        alert("[상세설명]\n최소 30자이상 입력하세요");
        description.focus();
        return false;
    }
    
    // 분류 체크
    if (!category.value || category.value.trim() === "") {
        alert("[분류]\n상품 분류를 선택하세요");
        category.focus();
        return false;
    }

    form.submit();
    return true;
}