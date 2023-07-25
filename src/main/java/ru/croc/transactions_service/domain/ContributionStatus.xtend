package ru.croc.transactions_service.domain

import ru.croc.ctp.jxfw.core.generator.meta.XFWEnum
import ru.croc.ctp.jxfw.core.domain.meta.XFWEnumId


@XFWEnum
public enum ContributionStatus {

    /**
     * Запрос создан.
     */
     @XFWEnumId(1)
    CREATED,

    /**
     * Запрос принят.
     */
     @XFWEnumId(2)
    APPROVED,

        /**
         * Запрос отклонен.
         */
         @XFWEnumId(3)
    DECLINED,

    /**
    * Запрос удален.
    */
    @XFWEnumId(4)
    DELETED
}
